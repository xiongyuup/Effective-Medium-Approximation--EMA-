function m = mg_refractive(m, mix)
% 麦克斯韦-加内特EMA用于计算复折射率
% 参数：
% m: 介质复折射率的向量
% mix: 介质体积分数的向量，length(mix) == length(m)
% （如果sum(mix) != 1, 这些值将相对于sum(mix)计算）
% 返回：
% 有效介质的复折射率的麦克斯韦-加内特近似值

    if length(m) == 2
        cF = mix(2) / sum(mix) * (m(2)^2 - m(1)^2) / (m(2)^2 + 2*m(1)^2);
        er = m(1)^2 * (1.0 + 2.0*cF) / (1.0 - cF);
        m = sqrt(er);
    else
        m_last = mg_refractive(m(end-1:end), mix(end-1:end));
        mix_last = sum(mix(end-1:end));
        m = mg_refractive([m(1:end-2), m_last], [mix(1:end-2), mix_last]);
    end
end
