Return-Path: <linux-kbuild+bounces-1346-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD688D058
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 22:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF3E2E7354
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 21:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EAF3A8D0;
	Tue, 26 Mar 2024 21:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qa1qfIcC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF213C26
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 21:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711489980; cv=none; b=WAPZyYY+7575H2oNB+KMIbjS/UgbjNKNcOkbT3Xl4Yn1vljJigkQx+MVOH83V97YuX7D+PEF7e/VlOZorfjnCQQZBDMB4bDmF4fhP3vNHfzCFprya6f7ne0ZVLSy2htdihKcFlodV0Y3L6BYQOkHq5c7Z1ApdPCnA+CHnFvhojE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711489980; c=relaxed/simple;
	bh=Gd1KTyIORpHu4vSk6I3cEpHpWoYXH312uryFOO6D0Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwuEnKLLY/4BDPCsXS/AWwK+2RbpKg0GJ6WcdQ8y4EP0wHGdGsTMwipLBPfxyFcQoXZkywjltOXiPq4rSmnSU3tC4ErjsQFxAFGb2kE2jTCPVLSA5XlGE9yXlPnmjVxVZSAUoUqI5ifpn8QmUcL+/JBhUoaOkHeNyKl2Uu2ADSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qa1qfIcC; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60a5a11b59dso66459367b3.0
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 14:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711489976; x=1712094776; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SLKQTjO7evp8ff/Z4Z6Ri3JN3vYy5yYHtQbf9bGHDrA=;
        b=qa1qfIcCb2xRJpEXEHvzJzWJQKdSC4a8psSfD1MsJfKFO7rZAM8+S9RXfMx8DAeT2C
         o/OlQcXTmBwqs0SPKy/SoyQqeyOzGhEiOpA0LzHsGIn8nRsjL9+w7JL9LDNajCsZ4udw
         hTH5hPab/frxPigvRBbV11PwB56d+EeFr3ogwLrzaYUapLO5J46IQqAMAKKuzyHWSpZX
         ms1Z6KQz2R1Javtc/O5ddSyyVc68SdwW+l6P+gI6X/dfvyb6YTMfntj04QsEk/CNGl0f
         qtJSKRbonw4Cdegb0T9wOes2UJy/cepdc0Wq1+PTo5WK6NM4tZa97pQWx/ve5aIbDs17
         3mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711489976; x=1712094776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLKQTjO7evp8ff/Z4Z6Ri3JN3vYy5yYHtQbf9bGHDrA=;
        b=XYibPEbIvfPiEnDoS92wxdKOGM9Nl/htqEyv0fN+uz+lH3gzlFEm5xW94mb9SnN9CH
         e51YN6qblZZQZJHhesya7vXqep7V4iYN6mSqEtkeASi9jebkJe/gVHxy205pc2tIJ8zu
         IehT8F/Ms/0ex0l13kkwwwBoj/0YwJppCt5Z/BrkPZkZLUI/k/hRx7r+WWoGqxDwoBQ1
         mts9F+2IdSEWqoeveB2Haoy+qhaRscxquwpnk2iO9IN6HWy5D9M8E8uc6q+BR8CXcPCr
         v19V5dMqsZBhIy0FMiNfQ1Jya+p5HviMEfKLoN070XasekghtN3PgGuzVskCDoZWsvsk
         ft4g==
X-Forwarded-Encrypted: i=1; AJvYcCWBwxYWtt4QedHVq++3WVJXUxNmC0g0hTy87+PEGDtb7KYsxr79gL2h5ZVJlTzNEgdvehn/Zku+JwlcuQLopslSCpercqpn3UL6qBEt
X-Gm-Message-State: AOJu0YxhGuXhByttbFEAejFukV0kn6J3Od13ITEwmqCWBZ1qzIAs6hWA
	cWTAE2mLq1hvFlqAsc7gxIMCZFgD12l7TiUQfsZQcgeLwPCoW96Pw5qfhtrsNRWu7E7w+dvCyXe
	WqTxyG0621Kp46An/jF3xgn+s8zrbdTYSaJWOtw==
X-Google-Smtp-Source: AGHT+IHwmwht+jbFfFX/AO7g6m6kcu9g5ldVuD/vPH3YDlyYIZOkuMHWGLBTx0aLMf5TKE4lY0jQzKUPbM8GlApUefw=
X-Received: by 2002:a25:10c1:0:b0:dcd:3d6:68ad with SMTP id
 184-20020a2510c1000000b00dcd03d668admr981590ybq.0.1711489976441; Tue, 26 Mar
 2024 14:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org> <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
In-Reply-To: <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 23:52:45 +0200
Message-ID: <CAA8EJprmeSqgMNVDw9Z=n4xBhmCtBzTJuSQKzLSg9NyPegYyFw@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 23:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:56 PM, Dmitry Baryshkov wrote:
> > In order to stop patching the mdp5 headers, import definitions for the
> > writeback blocks. This part is extracted from the old Rob's patch.
> >
> > Co-developed-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
>
> This is unused today right?
>
> Is it just being migrated now in advance as all the mesa mdp5 headers
> are moving to kernel?
>

Exactly. I had three options: pick up this patch, implement applying
'fixup' patches or drop corresponding doffests from the mdp5.xml. I've
chosen the first option.


--
With best wishes
Dmitry

