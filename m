Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B4329A253
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Oct 2020 02:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504071AbgJ0Bsv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 21:48:51 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:44943 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504069AbgJ0Bsv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 21:48:51 -0400
Received: by mail-qv1-f65.google.com with SMTP id s17so5321294qvr.11;
        Mon, 26 Oct 2020 18:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IHnoTQTxFaddUzMLOYWjmOEc9t/QaHFCSwo3W2FfFvc=;
        b=nDO6a3B48OZAVHdpuiO2xe9eAI7oarNO2CcIpUWsEVxU9s6EbB6+cKNu0JY7gcBvhL
         lftrycCFg+xr0dMSQgHIFSr95NhZBsIMevi5GnYBwotBGyUEZinAceFBfKiRXekug5S9
         lCyFHgMgOGyKuTp/WGBzzK02qTyVWQTUSY+z4fegN/ixjYV8BRia3A6IH6sG7QXmd0fZ
         GxwJ/8jyGm0Fc/iEBaxZfp8TYx//lfKQujGr/Tqk8zUlevwxc1aeqXoZOgWPIEFiEiqc
         CtBUlQ6HZv+a5BnlK17JQQDswBeVIho0QdLWym9+srvj8hi44SzW3CX0c82OAfSE1xfg
         sFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IHnoTQTxFaddUzMLOYWjmOEc9t/QaHFCSwo3W2FfFvc=;
        b=DWQZZ75TsvOKBGY/cxajRl1l3tH5i9ROy5ZVnyfvPJjwOdl5I/0KrdmMmfRMee04pF
         SOda3/lRqLblBweEvUAkX8MLhuEvOMP7FTPHpwVYcA5GoNGOMIYyEw4XtZ/EQ1CeHFD6
         DmneRmd9wRC0ynMSdRFn+fslk+Ckd29WisyyG3Kgh3aU9z/W2fMgdo9TJcphdMUssTZq
         pK6fd6FExrUmFfaEmeyu/dcPAaFWUGAnuXabzL41ipQSp0whYvWl/RuQOlUabMwEABix
         qgSNaBc9pQ4uhZJ1xkMWga2Ukz9WpswGluHhy2xfJBLwuw8e1hwXZraHqISrZf7MXx45
         Qp3g==
X-Gm-Message-State: AOAM533ItqFTFjU3mdkeO/cdJvJqGDI/td7U9K10VVx9AsElzmVKdHR+
        kM/2U5PWclTd95W/vOjJqzw=
X-Google-Smtp-Source: ABdhPJx080ThAB8gtaNArN9AIW6ubj+XpkmCw9Zl3Of9qQlSrE5afPiaYo0o7d3OyS4W533y3qpQXQ==
X-Received: by 2002:a0c:eacc:: with SMTP id y12mr156150qvp.31.1603763329046;
        Mon, 26 Oct 2020 18:48:49 -0700 (PDT)
Received: from ubuntu-m3-large-x86 ([2604:1380:45d1:2600::3])
        by smtp.gmail.com with ESMTPSA id u16sm8337815qth.42.2020.10.26.18.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 18:48:48 -0700 (PDT)
Date:   Mon, 26 Oct 2020 18:48:46 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH 2/2] Makefile.extrawarn: limit -Wnested-externs to clang
Message-ID: <20201027014846.GA368335@ubuntu-m3-large-x86>
References: <20201026220331.3896226-1-arnd@kernel.org>
 <20201026220331.3896226-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026220331.3896226-2-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 26, 2020 at 11:03:14PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The -Wnested-externs warning has become useless with gcc, since
> this warns every time that BUILD_BUG_ON() or similar macros
> are used.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Also see:

2486baae2cf6 ("objtool: Allow nested externs to enable BUILD_BUG()")
6cf4ecf5c51d ("perf build: Allow nested externs to enable BUILD_BUG() usage")

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  scripts/Makefile.extrawarn | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 6baee1200615..9406f752e355 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -61,7 +61,10 @@ endif
>  ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>  
>  KBUILD_CFLAGS += -Wdisabled-optimization
> +ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wnested-externs
> +endif
> +
>  KBUILD_CFLAGS += -Wshadow
>  KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
>  KBUILD_CFLAGS += -Wmissing-field-initializers
> -- 
> 2.27.0
> 
