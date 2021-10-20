Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316B64350C5
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 18:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhJTQ5S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 12:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhJTQ5R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 12:57:17 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E74C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 09:55:03 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id y7so3456628pfg.8
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+61ToYY1CxwLohdHscez1ug/0piK6waGWGNcAh2gGDY=;
        b=CtIjzxcqjDktaXjk+vDg68R+wTWogmL4ydvHnJ9r5M9GOKoHMertAJ1+1J54jDoPcG
         1vUXJYQTle2izXjZpaFtPGdNrogA/15tEppQyDJey/Yk8RM2OPNPXoAnVbx6jgqg7sTY
         q/XpdBC7mSDbsegKjQe8AveXrCGZ35y+IfihM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+61ToYY1CxwLohdHscez1ug/0piK6waGWGNcAh2gGDY=;
        b=Aom07wiDOCb+tvoKkndcqTehUCPSNBNI9+WRC5hTkJosNKvEQ/CtXc2mc9tLwnAw82
         buvVhEtsaoAkiqawRS+1a2YaAUmeJ62iLFQGGLUbcGLR9hHigEkUUa3yc6SOTeog42Yl
         gzAkUJkQdb1kd+14b1RfgnRz8XILc0WGOYAXLlKKzFCK9UdeC0Uvpz0W4oXN31S2E4j3
         KSpvikmGzo9hWscf63OMjHabCqbvQwazHrxt9/I4XJwvki2IApHw7UsucHjKb7irdtwh
         VfZxpHXfWuhZ8SFfkLSDk8dyC7c79heHRrXpcPi2E4g60GeyMTUICuzbZ3Wg1m8xScug
         A/yA==
X-Gm-Message-State: AOAM530L5dj0/KFLhXLXoTkUoQ9p7w/KEQcO3/eoz5gNC8DhMTafaisW
        Q3ZkvoSXTTs8IFL8xWtybOZCzw==
X-Google-Smtp-Source: ABdhPJwGf0ohCRVYKf5kmK73SFsYGzZWZiQQFxPxPszUupiGs7Hyy7z6sbAhAE4GQzlTmmDF/G46Lw==
X-Received: by 2002:a05:6a00:1346:b0:44d:242a:8151 with SMTP id k6-20020a056a00134600b0044d242a8151mr436671pfu.62.1634748902784;
        Wed, 20 Oct 2021 09:55:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f15sm3090201pfq.193.2021.10.20.09.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 09:55:02 -0700 (PDT)
Date:   Wed, 20 Oct 2021 09:55:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Ye Weihua <yeweihua4@huawei.com>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        daniel@iogearbox.net, andriin@fb.com, linux-kbuild@vger.kernel.org
Subject: Re: [QUESTION] Compile error on ppc32 with compilation option
 '-fdata-sections'
Message-ID: <202110200954.F8F7A52@keescook>
References: <fe5a0d0c-0394-5866-8b92-e91f348a3a2a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe5a0d0c-0394-5866-8b92-e91f348a3a2a@huawei.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 19, 2021 at 10:14:34AM +0800, Ye Weihua wrote:
> Hi,
> 
> 
> When I was compiling the ppc32 kernel with the compilation option
> '-fdata-sections', a compilation error occurred and the message was as
> follows:
> 
> 
>     "Inconsistent kallsyms data
> 
>     Try make KALLSYMS_EXTRA_PASS=1 as a workaround"
> 
> 
> After comparing the symbol tables, I found that the "_end" and "__bss_stop"
> positions in Symtem.map and tmp_System.map are different: in Symtem.map they
> are in the middle of the symbol table. In tmp_System.map, they are at the
> end of the symbol table.
> 
> 
> commit af73d78bd384aa9b add "strip-debug" to improve performance. However,
> the addition takes effect only for tmp_vmlinux but not for vmlinux. As a
> result, the symbol tables are different after the "-fdata-sections"
> compilation option is enabled.
> 
> 
> How the "strip-debug" compilation option affects symbol table order?
> 
> Can "strip-debug" be added during vmlinux generation?

How did you add -fdata-sections? There needs to be a lot of special
handling to use that option...

-- 
Kees Cook
