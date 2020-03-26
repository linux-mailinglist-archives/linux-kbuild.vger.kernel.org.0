Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE0419358E
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 03:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgCZCGA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 22:06:00 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55856 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbgCZCGA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 22:06:00 -0400
Received: by mail-pj1-f68.google.com with SMTP id mj6so1820145pjb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2020 19:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vlnuxU0Jd+J1XTS9gyIBvTWZ9T9coN3Nnt26SgcjdEs=;
        b=fGTyR1bNh6v3jArHJ+uGOudV2B8Z3SE7Mdp59SLHxcWMD/Mes3HtcrHkrBxG2R4PrX
         xbNG1DiksQ+r1yAFwlA0JPvXUrqFA2FrnP8nFtHCA+4aC8TdijG0wgJbK8W3xCij0a9t
         i2wFwnT//qGc/PmWytoQQM551ctE44xKeNmpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vlnuxU0Jd+J1XTS9gyIBvTWZ9T9coN3Nnt26SgcjdEs=;
        b=meAu2fk/q+XTkEiUb6sZREMBUGjdqEqU+e7BTgvuHPj7YveCxwIanorlna5CP+EHoE
         KFn7MpN1JTXDi72j0p0dmiRdXZUKB/2Ma+9UjO5Xa2bwwYp5mCWoTo2R7erUX7MMpf8c
         DqkH2owYj+NS6I79eavvtDYps6syK/9mpm9MBqoFc2H5RPasSUN5B/IwwxVzPbb1fqAT
         KDDzoNXuCcBxNi0gcEm0GmybDzdOuBZLnOKFNmIdP8UUCggUFCcQk5Lxb1KRzt1Ji81C
         GrAMuNcormA6hrZOZZ9roO0KgmUfrYy8lCg29UW13t0Q02Ai3tDwKHG+WXBfucbrWrEe
         EKOQ==
X-Gm-Message-State: ANhLgQ1UIPbQ9s4wTSwVzhWimrnbdpZ8rtfpelDFlovXPYjVi9qxhCR4
        tVqyfZpFpv8UILTmAu/16sDrjx3hjtQ=
X-Google-Smtp-Source: ADFU+vtwLOI88fBSQtGyR5JaoTXCXFGWWVq1JDhtNRplpCnxPeq1UQjoFZ8pj7Gc2W6YDWdBID3pfg==
X-Received: by 2002:a17:90a:d3d5:: with SMTP id d21mr514689pjw.27.1585188359074;
        Wed, 25 Mar 2020 19:05:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j8sm434011pjb.4.2020.03.25.19.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 19:05:58 -0700 (PDT)
Date:   Wed, 25 Mar 2020 19:05:57 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, kernel-hardening@lists.openwall.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kconfig: remove unused variable in qconf.cc
Message-ID: <202003251905.6D43E64@keescook>
References: <20200325031433.28223-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200325031433.28223-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 25, 2020 at 12:14:31PM +0900, Masahiro Yamada wrote:
> If this file were compiled with -Wall, the following warning would be
> reported:
> 
> scripts/kconfig/qconf.cc:312:6: warning: unused variable ‘i’ [-Wunused-variable]
>   int i;
>       ^
> 
> The commit prepares to turn on -Wall for C++ host programs.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> 
>  scripts/kconfig/qconf.cc | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 82773cc35d35..50a5245d87bb 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -309,8 +309,6 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
>  	  showName(false), showRange(false), showData(false), mode(singleMode), optMode(normalOpt),
>  	  rootEntry(0), headerPopup(0)
>  {
> -	int i;
> -
>  	setObjectName(name);
>  	setSortingEnabled(false);
>  	setRootIsDecorated(true);
> -- 
> 2.17.1
> 

-- 
Kees Cook
