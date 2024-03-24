Return-Path: <linux-kbuild+bounces-1307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E7C887C5F
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 11:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548971F212AC
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 10:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176E11758E;
	Sun, 24 Mar 2024 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G95JJGm6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBC1171B6
	for <linux-kbuild@vger.kernel.org>; Sun, 24 Mar 2024 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711277877; cv=none; b=jaQWlCLw3nm6s53HDB+GkbzzZu00IKxdgnORrOlEa+sHXglNg8Jeecx8wHD38r+YsZU+u+XI3BxWI9sbI/FgeQxizNnsIALNVLu0tKdrvoiLtAX9UebqfyDcMyN3z0SQegjDe2mjXOmiUCqWbjrgp8t9JAVIKXY3hu8vZdpSfWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711277877; c=relaxed/simple;
	bh=1iLGzSY1OQz1GUJJdmZTp9JlAi+kFWZEwt2u9TKtmjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3jpO4hUCbl2i25z31NBWmsY96HhMttCcdVmdIKZA/cz9VwvlrTVKU8QQNS6JgnB8g2h/ybsHYM/M4eKolJwENJHiqMOvU3+8lfUfEEDS34/cy3rZEhrza68L0390ST1TlK3Ii7R71rb9cBngmqlGlTHa2wyxlauo+tl42ZD/NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G95JJGm6; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60a0579a955so42310667b3.3
        for <linux-kbuild@vger.kernel.org>; Sun, 24 Mar 2024 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711277874; x=1711882674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dKOizG9PbYAwIIoEzDwzNQWV7wqYGQ4/VdGXW3+D0uE=;
        b=G95JJGm6unS//N9x0v8eXrpjUfSiplSVmJjI6ns0eC3BZ/rnrUgyrarS9NiWZIAX3q
         r4Jktkef/daM6jVBgpYAdMWEKAMyzYj+p/U9paD8hOWrUUNuXUMjfqV2uf5mnvuqMMjo
         jnJOms1HgOTobG1RKUW6VqXPlcy/m7oSSNUniPqDq+XS7o5WtIf2u8A/nyWpo7lVLBGz
         206vRCCcr7Viop48zGxJra68/55xFkx+bYfKqDyjdUYsKn6IBwk+gIcrn6Az9QZn3KyO
         FyAXkcGSphnlp6PKaMRisdfXlP2ye3qeqDl+M5mjfq2umKvpTFdLfN5k0XJbj7SfTxYf
         ePvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711277874; x=1711882674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKOizG9PbYAwIIoEzDwzNQWV7wqYGQ4/VdGXW3+D0uE=;
        b=BCdCPOfRbdmiU+IONJygBICPlLaBdWdGwGIuo48RxCW0J79Bhf3MfsRxob6kAnFSSZ
         MSjahmzJ5K+Gm8sXzxM1MKQJsl54OJzqBCs3MQ3Ugy+lTu1P1gWUQVvZPIDfA5RT5IV5
         i/oa1qpp30KbwOkLGW6PFdv1byJv8tBn5UKjgmqBtSxAXB56piInoSCQ7iwtOjaAUt3D
         CMDVeMO1+EPp3rjm4aUXIc9sSRGBbei2bzF5duvtvGXIquWJBa0uffhzdq1qbFEE6XvZ
         zd3to2+l0tHhAfC83VPiT/oedtNbwGcR1K8/ftjw0QZwM/KTucloM1H64AlKcN8Zlj/Q
         YDXg==
X-Forwarded-Encrypted: i=1; AJvYcCXykkEEHAgy7UxTsNH/k89Kz9YSpU83f76xuBtLpmsrWb/vgfQhnmiAP6Y7FoQdrPV4bFg+c715sdFZyyDF8wl7pN8/k5uooq/ejf6M
X-Gm-Message-State: AOJu0YxAeKbeCIHLUAf/LRTdBZKy/Hc22XFS4UwzPKDBMkjknr259+BV
	Kt+aYddrbChwXFXVj3b+BsKBSyn3gT8zwd10bBl7fDvCuTvhG0N7EyGKehLdZDN7eCo3ir+V7kp
	IcOt5OsHWt4lT3W6B5Lng6l5r1WwCpUQg7pZ7ZQ==
X-Google-Smtp-Source: AGHT+IFkNNzpGCHNVGuHvvSWfPZSgwg1RAQpdjkiNapdwrzO0RfGnrZYm+TKLaP2muu4ukqjYZ8fO611rcTztYESaRU=
X-Received: by 2002:a05:690c:ec6:b0:611:2f86:7864 with SMTP id
 cs6-20020a05690c0ec600b006112f867864mr4318637ywb.3.1711277874516; Sun, 24 Mar
 2024 03:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org> <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Mar 2024 12:57:43 +0200
Message-ID: <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 Mar 2024 at 12:30, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
>
> Is this approach common in upstream kernel? Isn't it a bit awkward from
> legal perspective to rely on a source file outside of kernel during
> compilation?

As long as the source file for that file is available. For examples of
non-trivial generated files see
arch/arm64/include/generated/sysreg-defs.h and
arch/arm64/include/generated/cpucap-defs.h

-- 
With best wishes
Dmitry

