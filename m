Return-Path: <linux-kbuild+bounces-6570-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A59A84803
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Apr 2025 17:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9CCE7A5A8C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Apr 2025 15:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C241E98FF;
	Thu, 10 Apr 2025 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXsKzcVy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1E81EB1AA;
	Thu, 10 Apr 2025 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299206; cv=none; b=XP7wD5bX0xDtpMJyPBxi10VWBYANdLKBsJSd0LTEWm7Fxir2xh/+q8McM+0Aq0qmKp6feuR92mPB/qmMdfUd6kjr+tk9f3ATKbPja26VBqbOw3z/0ykEWyYFbS4sYhtP9LXPnQploKoZDjFeRBeXekhIgX/dOKzZ/VvPU6ZYDN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299206; c=relaxed/simple;
	bh=rqS2mgSGGMtXh0MDTyHoB5+bCseRAIgyQhVryVg3D+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUvJOf3KbP2Xq/Bq9i1ryTt2XR2idi8Db8ZndmtKxEtIXN9z2GGvpZ9/Epg9uu46i2b1V3wf6/g6RiMTcodASAM7Ap/zYTIhTVDwDMRFXE9wd603IkQiHQI1ZTpJH1ZKH/mywc38FthUKECnBQkWuCYT92+zEJlUEXt19IjL/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXsKzcVy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so10427125e9.3;
        Thu, 10 Apr 2025 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744299203; x=1744904003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mufWQBCfhfh0Dd1cBFQEeIzlzzUVdMj6j6jZsR61Hv0=;
        b=BXsKzcVyPz5yiV8SQeIFnAxdzZKQqytkvAQHR9yn62Wffw+P8vN2zkKT3EOTQnmN2N
         ckKfkBdragTyTRoEbTh7vdmfRxjcLfQPey8/V3aMzapMFP3KJ3SvuyBs6zGT+iaDA5tF
         5B1bifiMPOa5t7djwVStlEKPt8PFDUeYxhL9RlC3gxMYl1pSf3h940ny/BkPBzt7Q72J
         hIBDPIwFYiQe7L1EsUXhDmyfj1RB4Q/L+/Ko+LwYFok/LcIrmtwdfQZXOa4MoiNP7BbS
         yNlZtN+c3wU8M36Bxl439KuuwX301AGNil+yChXORjpw4fQ8VZVSO7DgxMSObg+nPGwL
         cJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744299203; x=1744904003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mufWQBCfhfh0Dd1cBFQEeIzlzzUVdMj6j6jZsR61Hv0=;
        b=UNeJJywidGN07Vh7iDG/W17Bwx7mmlxx+ToktMU3Pbt7JddNjhWgieGYKDoUc8v8D6
         YnWecMEmTRwc/Rz9sk8k/PmXgQ+sb4CYT5WTbMnn3gzaPuzoUGh6GrkV/LfhPc53VaeL
         pMPFSRaLvnOg4P5erPNdj57mHuC/4Dv8OwwrJMQn4ze/TcYgF9I/ZmqvKi/iQeWeCMB4
         Cw7CjEN0tkkc8m7XiVh1w8fXMr9QMG61rC2b7ZQNz0+ctizB806IFD8/F/0CDrw7UftB
         kQKejIkkHtLegpa9bwkd6hIGky7qdWf/qwIAyEgfFo/xUnNxBMpAqY3+LPJhwYK16gna
         O+eA==
X-Forwarded-Encrypted: i=1; AJvYcCVuShI7wDFmjha823aKXFoU9UwBtTEaEZxR609EwEn9xQX7056qTeUiv0Wlsij13JYo43A6sMCdMoui0qIZ@vger.kernel.org, AJvYcCW3MhqI7h3IBZCmTeHsZ9tq3pBAyrTkvboMma8CzMceEpQIu437g55YpxasBzzepOYRdQO+OI1fWYHbACky@vger.kernel.org, AJvYcCWjaJVEoLTTPT7O1sw8KUqFFBTN+Ei75lci7+BMvqI+XucASGWaqzdxEwSaYknKhKWJscDf6NIgF/g9addJLyubA+9aLQec@vger.kernel.org, AJvYcCX1X7weWfKCjElCHOTUiXCU9rP7UA3EU3n4/IeLcQU+iJgEI86MrOKqGkT5gEN6r3ej/gxcuVWDwTCk30sy7R4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2pHfP/dH8CLQPoZ7ekeGwWUv3/r8E4emK5ALZaSY5X4PujJtx
	Lui2IpiHpo3iUNVrws4peuzvDhcReMohynP+faKC86sYenJqsRCU
X-Gm-Gg: ASbGncumS1KCYCt26TeDz//Ae/toAjkgEcehklhwhfUGQskTFcLINAyTOS1iQAfcKNB
	ld3v/LQNTG0XxTEsVjUoj1NCxfXX6i8yNu1fmKPLrcssCR+NyZXEQ18vjYcqrUHPKpRVtRYuvXO
	TGl9fP2X/2T+PCFp+TxpKk9aWTwP0GsDbkyCi5+HoTv64fUdUVZbCJn2UUQWpVntAmxlRyIDJvW
	bUxSgkqZUMU+C7QPZvTIR5W2/rq1CH5UAY/XfdgI31teEkaK4rXkAENI34JhI+PglHVOeIPo19K
	6c5F3r+yTNyoLvt3gjXkeCi2bPRjIdI8U52MfEpPZt5S9n4MTyDjJpNnzwAMXs2QLnI=
X-Google-Smtp-Source: AGHT+IErpYp47RaPcYNUotAQy19lNREpqUTjnBlbW3tbQQAJj+KKVW6iLFYXKxgBNzOHVVtZNPx5rg==
X-Received: by 2002:a05:600c:a087:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43f2d7ae775mr43635555e9.3.1744299202992;
        Thu, 10 Apr 2025 08:33:22 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2075fc6dsm59209915e9.28.2025.04.10.08.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:33:22 -0700 (PDT)
Date: Thu, 10 Apr 2025 17:33:21 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: mic@digikod.net, gnoack@google.com, paul@paul-moore.com,
	jmorris@namei.org, serge@hallyn.com, kees@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	linux-security-module@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [Bug Report] A compilation failure occurs when landlock and
 RANDSTRUCT are combined with GCC 14.2.0.
Message-ID: <20250410.926dbc57c00b@gnoack.org>
References: <337D5D4887277B27+3c677db3-a8b9-47f0-93a4-7809355f1381@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <337D5D4887277B27+3c677db3-a8b9-47f0-93a4-7809355f1381@uniontech.com>

Hello!

On Thu, Apr 10, 2025 at 04:11:15PM +0800, WangYuli wrote:
> [ Compilation failure log: ]
> 
> *** WARNING *** there are active plugins, do not report this as a bug unless
> you can reproduce it without enabling an
> y plugins.
> Event                            | Plugins
> PLUGIN_FINISH_TYPE               | randomize_layout_plugin
> PLUGIN_FINISH_DECL               | randomize_layout_plugin
> PLUGIN_ATTRIBUTES                | latent_entropy_plugin
> randomize_layout_plugin
> PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
> PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
> security/landlock/fs.c:In function ‘hook_file_ioctl_common’:
> security/landlock/fs.c:1745:61:internal compiler error: in
> count_type_elements, at expr.cc:7075
> 1745 |                         .u.op = &(struct lsm_ioctlop_audit) {
>      |                                                             ^
> 0x7f27fa6bdca7 __libc_start_call_main
>        ../sysdeps/nptl/libc_start_call_main.h:58
> 0x7f27fa6bdd64 __libc_start_main_impl
>        ../csu/libc-start.c:360
> Please submit a full bug report, with preprocessed source (by using
> -freport-bug).
> Please include the complete backtrace with any bug report.
> See <file:///usr/share/doc/gcc-14/README.Bugs> for instructions.
> make[4]: *** [scripts/Makefile.build:203: security/landlock/fs.o] Error 1
> make[3]: *** [scripts/Makefile.build:461: security/landlock] Error 2
> make[2]: *** [scripts/Makefile.build:461: security] Error 2

Thank you for the report!

This is in my understanding a duplicate of the discussion in
https://lore.kernel.org/all/20250407-kbuild-disable-gcc-plugins-v1-1-5d46ae583f5e@kernel.org/

–Günther

