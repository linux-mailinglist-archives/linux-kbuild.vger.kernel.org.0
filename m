Return-Path: <linux-kbuild+bounces-730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E18431A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jan 2024 01:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC50286716
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jan 2024 00:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4659337B;
	Wed, 31 Jan 2024 00:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jWVR3J18"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D48F195
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Jan 2024 00:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706659337; cv=none; b=D4SF99g2ttygfDfp9t3QjKCvLUxn08PLdADaeKjQxaY65eVZeSOGGBVrezEFRo51JY5OWbjRY3RiOLkEGO3iAZVlHrIGV+wiz1OX02Td1yhePx3tUhe17BCQ0qPar73x39xKl3RvcFOTHTJXrREzK4Vox60elbbJpATwj3uInLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706659337; c=relaxed/simple;
	bh=ELB3rB3pTBAyVWgkgbBLwzuWJhChYKsQ8NutVLQX82k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S56IqOH0nw8rnN3JJvAEFeYv4ViLZgC2ECQyDopTX7Mmxrp3jzw8dBzfifJnqzssQVNoUnZ+KJSHzsrkIV4DFx6/R55mQ44V6EBmv2DyWNh7/CciRLI2T0gPqmYPxG7YO27wSdRJ2Ti658MpUvqXa2UQQaY3QnCUql/I11quDyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jWVR3J18; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-510221ab3ebso6326875e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 16:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706659333; x=1707264133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZ6gV8n3Hy2+6G1uDais5tZDUXuFFy3xqXRf85finO4=;
        b=jWVR3J18qkkTjdsy+xcFSy+A6rBeKCmwleOTUs0mnkVXpplcvv01S9hHXP8WwIZAoF
         5ucFC2BWA+23VS6ZSLLAu4TTgeQ4tC5hAMa++SWmA4UKngdLtUIPGQradv36TOxql9RD
         PJGEJci8uOhb4SWvMWUoVnvx8y63xyih4mfVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706659333; x=1707264133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZ6gV8n3Hy2+6G1uDais5tZDUXuFFy3xqXRf85finO4=;
        b=DaqCwbLo+EGUjzL2xf/c9ICOY6VW5YbOveZVoc0d7E4A5NFcyr/3wq0fTBnN7iErQT
         AfHEDtN14EuAKLRbcTbiTW4qb5CvKZXVdlMGqW+bmtazIxuMTG06wV6TXRawGXSWF+4B
         ON1PJRd2OkprsmMR9Nyo6MxYUv5ALoDwB47K0qd58XQdEtgMZdNDDq1FsjKz7FfQkWwD
         PdoRup86pzFvTTaPpIhk88ecUIO0VD7+NTa7Iw+rtkegEMWcC4QQHYUXyoueZ0zUPF1o
         pgJnVnn7gFW+FhtOnz428ALrJiSMAF8OuGZcUE3aidgTI07fBkcEWmD3etd/9xzibNur
         e9fQ==
X-Gm-Message-State: AOJu0Yyzbp8dm92J9hEQq7seRykimHXUL5pve+4stu9qqeUebRO3dEAO
	ZFxx9JAzjm8xd1seIAll50Kxv5yZeTl72HqafKOBYPzloFexr05N1r0PLymkBfWMLVpVWlle2k4
	=
X-Google-Smtp-Source: AGHT+IHk9MC59nxmL1mkdAy0WfYMbKypT/BhUUV/WlfESBPtAp82+iuYDajW+tE1Ccz09JgnPYT8og==
X-Received: by 2002:ac2:4468:0:b0:511:9de:ea8 with SMTP id y8-20020ac24468000000b0051109de0ea8mr98220lfl.23.1706659333093;
        Tue, 30 Jan 2024 16:02:13 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id pv13-20020a170907208d00b00a35b708185esm2786147ejb.71.2024.01.30.16.02.12
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 16:02:12 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40ef75adf44so22612095e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 16:02:12 -0800 (PST)
X-Received: by 2002:a5d:680e:0:b0:33a:e828:c3e6 with SMTP id
 w14-20020a5d680e000000b0033ae828c3e6mr15698wru.30.1706659331581; Tue, 30 Jan
 2024 16:02:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112131857.900734-1-nfraprado@collabora.com>
 <20240112131857.900734-3-nfraprado@collabora.com> <ZaQVScQ2AYquG-Zr@smile.fi.intel.com>
 <ZbA4VthTMPT7BSRo@google.com> <2024013059-poison-equation-81d1@gregkh>
In-Reply-To: <2024013059-poison-equation-81d1@gregkh>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 30 Jan 2024 16:01:57 -0800
X-Gmail-Original-Message-ID: <CA+ASDXM-m6U+JFvBSSHMxAf8Ct-T-pL8tmcHxHQjepdRFR-s1w@mail.gmail.com>
Message-ID: <CA+ASDXM-m6U+JFvBSSHMxAf8Ct-T-pL8tmcHxHQjepdRFR-s1w@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] firmware: coreboot: Generate aliases for coreboot modules
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	Abhijit Gangurde <abhijit.gangurde@amd.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Nipun Gupta <nipun.gupta@amd.com>, 
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 3:51=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Jan 23, 2024 at 02:06:14PM -0800, Brian Norris wrote:
> > "Don't you want to have a driver data or so associated with this?"
...
> But why limit yourself to 32bits now?  Why not make it 64?  It is going
> to be sent to userspace, so you have to be very careful about it.

Is that question related to the question I pasted/replied to, about
driver data? Or a new topic? Sorry if I'm misunderstanding.

Anyway, for the size of the tag field: I don't have a strong opinion.
But FWIW, they're coming from this project:

https://review.coreboot.org/plugins/gitiles/coreboot/+/269b23280f928510bcad=
d23182294e5b9dad11ec/payloads/libpayload/include/coreboot_tables.h#36

As you can see there, we're extremely far from exhausting 16 bits, let alon=
e 32.

Brian

