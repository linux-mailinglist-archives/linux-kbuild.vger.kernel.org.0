Return-Path: <linux-kbuild+bounces-9469-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EACC9C455FB
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC31D4E565B
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 08:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CA22F49E0;
	Mon, 10 Nov 2025 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QrN6e7Vm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D522B8A6
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762763316; cv=none; b=iLpwJn0EkJXyyuHW2rRZb6RRdmC5aWId5mWqJ+h2UiNYUjKD0OsPzXe58+p9Glg4AdzkzlHTVCTUAGzCqMZXlMgC4sOIYhsvgwEcq0FALgdY7jB0ia68gjHlnNQDe4wfkm8Vujijmy+x4w51Gf4gBt+Pa+zGDZJiGfnzn/ITWFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762763316; c=relaxed/simple;
	bh=s5iqABizyTsx5/aNOAa3LoP02EYNoIbfADX/c87JJh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHwPtVqzG1AV/UFU+oXeTjJr5zBx+O0liPnBhtwZZ6YzwCoEx8IKzd0Hi+PSQfnkdm1Mn8lXyKlG8OaoaX7l4jEOEruWj89l+HqihL1WN0suh66JWKWXooOsFGHYvE6lFvmOYm9f4XRvg+665wBkPCFeNY2BYn8ZsqLWN6qXKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QrN6e7Vm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3c965df5so211223f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 00:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762763313; x=1763368113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LKSTj91dcFVmbB7NkANhTbRS7BofOtUF10VZ1W0mr10=;
        b=QrN6e7Vme9dc2jdODThYZwp9ucu6IygdK3jb/UsECsVJU/qCP3ZBqzZr/VO2rMt8JX
         B/Yq69fszt+IK9IrR7q2hyif1ZJTPa8REnnCTANKR3g65cQ7Y0DJ4GCnK2c6Gyrxxhn9
         lANLLJkNVymSjI+p9PNG2ESOXCFBGMaU8LzXNzXASTgwUq1tPxSekagYDUV09J86g1os
         9dZ9XTUnuqLAXFNJctjhQacsKPSjmFGKI0Ytkcz5aFtXWlLU6HqeduhsT0FbHf3AU6qY
         vmqsHjnTo/ilSOrU8u99pnAeM3YS3A6fFHPOrp9VLouGR+0FqwB32YwP60eg0/KV2Uiz
         AItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762763313; x=1763368113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKSTj91dcFVmbB7NkANhTbRS7BofOtUF10VZ1W0mr10=;
        b=N28hY1kmArusbmgakeLfcdhrREeJZheBwDyxjG9XuFUmJGHVpbTm66gVPs+25pxDMo
         LGjvCKz7DjYQuPCI/27WkY0SF63cuUUc0xYFyekIyN+7lb6uLbnWQrLq5FidXMSdgdGF
         Bk23FLJn/IuWKOyfb+XF1fsZRzf39fmReTUsqGXrlLOMbkuE9yc0cLf+fh6otAFz3Ucm
         R3Ird3NlvctrMm10vgHdnXlLCD1Ymbribpj/I8upxmveu9ZvqVh1z5Z61RQGlbv6m33X
         PUVGY00SFj0bDbu/rIlv7jTVRxZ9bn1mTmvQFyDnlfiH972NLcSKRYI+tExRcdeBHr/F
         /Z/w==
X-Forwarded-Encrypted: i=1; AJvYcCUH+JMsjzge08iLZPCnWcj0zvglKJHxQnMgEX9tvkTaWio8CLbH36kWJsPTm+6Kcy/29tdVtSVXzuyaVGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YynpnuemeGZAlmc5yHUd1i0giPTZI6RGKPNFXtnCv2h644IWuLt
	pdb/NjE51nNLYv2f0buc0nnCs27oDZ/h6HfRj0G83HFeuDCAEd7yD/o+IGsuxh1mdqY=
X-Gm-Gg: ASbGncsi1QSfZlmLsf9ujYVntBpHyarF3c5O5d4besE/DfjtTEyUHHMW1xG9njV5Ezw
	9Hx0xwF23al7RR9+C+qrnCJQ/r2T98TeukYuEG/q+uT/mACATbBA207agEkLwZKbEKAieKQbRTu
	4K2DhixZlUB0cTaAOPd5hm2NnE2Z0/C74R5ptdtaNDU8oqwCrdN66vp5RC7luAjo5Fdt4Rv01Rm
	bl/sS1b2zitAs7+/nGn//w57Np+O3kZOCaTcH4KFf5kqzZP8lpeM1wjbBqLy/RNIkHmM/5shR80
	yEBLi2vVis6r0BmaOs3uxM5Rta9f7pqcMselxZQvyKFmrqo4I5tpTBZFxFITTy+zEVk2cmhhqaG
	Qc6CO6xWeoxd8JEnDVsNJeTJ50OmGUdvCbzBmJAXBKkpmQPEYYiilcW39VsgxkbVGXzj4d8npxg
	sRo2i3wNs=
X-Google-Smtp-Source: AGHT+IEtUA/RT9kyVzGnwoHJZhdWBJKBW3uwg0FiWGaP3sARVQB3SyFfIiTIHURetWKhGAZ1x21nPg==
X-Received: by 2002:a05:6000:1888:b0:42b:40b5:e64c with SMTP id ffacd0b85a97d-42b40b5e9dfmr115370f8f.30.1762763312634;
        Mon, 10 Nov 2025 00:28:32 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2ee2ed31sm13815116f8f.29.2025.11.10.00.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:28:32 -0800 (PST)
Date: Mon, 10 Nov 2025 10:28:30 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: Properly fix CC expansion
 when ccache is used
Message-ID: <yylihpoko4xxk4i5o7qfuidn4ve4vjedfbgc3uzysgvhla2fyb@2c5inm3xmwky>
References: <20251110-kbuild-install-extmod-build-fix-cc-expand-third-try-v1-1-5c0ddb1c67a8@linaro.org>
 <20251109234124.GC2977577@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109234124.GC2977577@ax162>

On 25-11-09 16:41:24, Nathan Chancellor wrote:
> On Mon, Nov 10, 2025 at 12:26:31AM +0200, Abel Vesa wrote:
> > Currently, when cross-compiling and ccache is used, the expanding of CC
> > turns out to be without any quotes, leading to the following error:
> > 
> > make[4]: *** No rule to make target 'aarch64-linux-gnu-gcc'.  Stop.
> > make[3]: *** [Makefile:2164: run-command] Error 2
> > 
> > And it makes sense, because after expansion it ends up like this:
> > 
> > make run-command KBUILD_RUN_COMMAND=+$(MAKE) \
> > HOSTCC=ccache aarch64-linux-gnu-gcc VPATH= srcroot=. $(build)= ...
> 
> Yup, good old shell quoting... :(
> 
> > So add another set of double quotes, this time escaped, to make sure the
> > aarch64-linux-gnu-gcc isn't expanded to something that looks like an
> > entirely separate target.
> > 
> > Fixes: 140332b6ed72 ("kbuild: fix linux-headers package build when $(CC) cannot link userspace")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  scripts/package/install-extmod-build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> > index 054fdf45cc37a8717444b8094daf3e1150a8ccf5..6cce5c41552d520bf069487352fd26417b0b3899 100755
> > --- a/scripts/package/install-extmod-build
> > +++ b/scripts/package/install-extmod-build
> > @@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
> >  	# Clear VPATH and srcroot because the source files reside in the output
> >  	# directory.
> >  	# shellcheck disable=SC2016 # $(MAKE) and $(build) will be expanded by Make
> > -	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
> > +	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='\""${CC}"\"' VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
> 
> Can we avoid the need for escaping the " by just moving it to the other
> side of the '?
> 
>   "${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC="'"${CC}"'" VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
> 

Yep, this does the trick.

Will send v2.

> This whole command is really hard to read but I don't really see an
> obvious way to simplify it.

Yeah, the only part I think can be simplied is pre-expanding the value
after $(build)=, maybe ...

> 
> >  
> >  	rm -f "${destdir}/scripts/Kbuild"
> >  fi
> > 
> > ---
> > base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
> > change-id: 20251109-kbuild-install-extmod-build-fix-cc-expand-third-try-2cb1540cadbf
> > 
> > Best regards,
> > -- 
> > Abel Vesa <abel.vesa@linaro.org>
> > 

