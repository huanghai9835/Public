for itr_idx = 1:max_iter_num
    fprintf('\titr_%d:', itr_idx);
    if itr_idx == 1
        % Calculate depth_coarse_vec from last frame depth_fine_vec
        depth_coarse_vecs{frm_idx,1} = fun_dCoarse2FineDepth(...
            d_depth_coarse_vecs{frm_idx,1}, ...
            depth_fine_vecs{frm_idx-1,1}, ProInfo);
        test_d_depth_coarse_vec = d_depth_coarse_vecs{frm_idx,1};
        test_depth_coarse_vec = depth_coarse_vecs{frm_idx,1};
        d_error = NaN;
    else
        % Calculate derv value
        cam_est_derv = fun_CoarseEstCamImageDerv(cam_est_vecmat, ...
            d_depth_coarse_vecs{frm_idx,1}, ...
            ParaTable, ...
            CamInfo, ...
            ProInfo, ...
            EpiLine, ...
            C_fine, ...
            ParaSet);
        norm_derv_vec = fun_CoarseErrorFunctionDerv(...
            cam_est_vecs(frm_sta:frm_end,1), ...
            cam_obs_vecs(frm_sta:frm_end,1), ...
            cam_est_derv, ...
            d_depth_coarse_vecs{frm_idx,1}, ...
            theta, ...
            ParaSet);
        test_d_depth_coarse_vec = d_depth_coarse_vecs{frm_idx,1} ...
            - alpha*norm_derv_vec;
        test_depth_coarse_vec = fun_dCoarse2FineDepth(test_d_depth_coarse_vec, ...
            depth_fine_vecs{frm_idx-1,1}, ProInfo);
    end

    % Calculate error_value for test
    [test_cam_est_vecmat] = fun_EstCamImage(test_depth_coarse_vec, ...
        ParaTable, ...
        CamInfo, ...
        ProInfo, ...
        EpiLine, ...
        ParaSet);
    test_cam_est_vec = sum(test_cam_est_vecmat,2) + envir_light;
    error_value(frm_idx,itr_idx) = fun_CoarseErrorFunction(test_cam_est_vec, ...
        cam_est_vecs(frm_sta:frm_end-1,1), ...
        cam_obs_vecs(frm_sta:frm_end,1), ...
        test_d_depth_coarse_vec, ...
        theta, ...
        ParaSet);
    fprintf('\tE=%.6e', error_value(frm_idx,itr_idx));

    % Check break or continue
    if itr_idx >= 2
        d_error = error_value(frm_idx,itr_idx) - error_value(frm_idx,itr_idx-1);
    end
    if (itr_idx==1) || ((itr_idx>=2) && (d_error<0))
        % Accept
        cam_est_vecmat = test_cam_est_vecmat;
        cam_est_vecs{frm_idx,1} = test_cam_est_vec;
        depth_coarse_vecs{frm_idx,1} = test_depth_coarse_vec;
        d_depth_coarse_vecs{frm_idx,1} = test_d_depth_coarse_vec;
        fprintf('\tdE=%.2e\n', d_error);
        % Break
        if abs(d_error) < therd_coarse
            break;
        end
    else
        % Reject
        alpha = alpha * 0.5;
        error_value(frm_idx,itr_idx) = error_value(frm_idx,itr_idx-1);
        fprintf('\treject. alpha->%.4f\n', alpha);
    end

    % Img_Show
    if show_flag
        cam_obs_mat = de_Vec2Mat(cam_obs_vecs{frm_idx,1}, CamInfo);
        cam_est_mat = de_Vec2Mat(cam_est_vecs{frm_idx,1}, CamInfo);
        figure(1), imshow(uint8([cam_obs_mat; cam_est_mat]));
    end

end
