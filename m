Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91ABF3EE87F
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 10:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239193AbhHQI0h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 04:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239681AbhHQI0d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 04:26:33 -0400
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CBDC0617AD;
        Tue, 17 Aug 2021 01:25:27 -0700 (PDT)
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
        by mail.avm.de (Postfix) with ESMTPS;
        Tue, 17 Aug 2021 10:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
        t=1629188724; bh=/FiAYbZ5V/xP9nJYeHj1jmYfb+z10OR2R3XTSk6DKBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BVFlgYBIqieofosLZaZyU6EzzYAEcoLUBmO12mygv003F2hb9PaVxeOlK/cTGNFAm
         6p137R/n0KwaVLgoTgVSKZlm1gtIrIKrqZxvNnxvrzxnk2XOnin+r71GiqVRS9OHke
         sbAJqkg3JtJvtlC3KToXpEfDQ4m63CWamgmR69Fw=
Received: from deb-nschier.ads.avm.de (unknown [172.17.24.144])
        by mail-auth.avm.de (Postfix) with ESMTPSA id 2481080369;
        Tue, 17 Aug 2021 10:25:24 +0200 (CEST)
Date:   Tue, 17 Aug 2021 10:25:23 +0200
From:   Nicolas Schier <n.schier@avm.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 2/2] kbuild: warn if FORCE is missing for
 if_changed(_dep,_rule) and filechk
Message-ID: <YRtyc1poEhr8YHYp@deb-nschier.ads.avm.de>
References: <20210813063005.1739278-1-masahiroy@kernel.org>
 <20210813063005.1739278-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210813063005.1739278-2-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux 11.0
X-purgate-ID: 149429::1629188724-00002E98-0D9EE8EE/0/0
X-purgate-type: clean
X-purgate-size: 2113
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Friday, 2021-08-13 Masahiro Yamada wrote:
> if_changed, if_changed_dep, and if_changed_rule must have FORCE as a
> prerequisite so the command line change is detected.
> 
> Documentation/kbuild/makefiles.rst clearly explains it:
> 
>   Note: It is a typical mistake to forget the FORCE prerequisite.
> 
> However, not all people read the document, or understand what is written
> in it.
> 
> People repeated this mistake over again, and I determined a compelling
> force is needed.
> 
> Show a warning if FORCE is missing in the prerequisite of if_changed
> and friends. Same for filechk.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Kbuild.include | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index c3c975a92318..dd48e68965f8 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -57,6 +57,7 @@ kecho := $($(quiet)kecho)
>  # - If the content differ the new file is used
>  # - If they are equal no change, and no timestamp update
>  define filechk
> +	$(check-FORCE)
>  	$(Q)set -e;						\
>  	mkdir -p $(dir $@);					\
>  	trap "rm -f $(dot-target).tmp" EXIT;			\
> @@ -130,7 +131,11 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
>  # PHONY targets skipped in both cases.
>  newer-prereqs = $(filter-out $(PHONY),$?)
>  
> -if-changed-cond = $(newer-prereqs)$(cmd-check)
> +# It is a typical mistake to forget the FORCE prerequisite. Check it here so

prerequsite -> prerequisite?

Successfully found the missing FORCE in arch/x86/entry/vdso/Makefile:135.

Tested-by: Nicolas Schier <n.schier@avm.de>

> +# no more breakage will slip in.
> +check-FORCE = $(if $(filter FORCE, $^),,$(warning FORCE prerequsite is missing))
> +
> +if-changed-cond = $(newer-prereqs)$(cmd-check)$(check-FORCE)
>  
>  # Execute command if command has changed or prerequisite(s) are updated.
>  if_changed = $(if $(if-changed-cond),                                        \
> -- 
> 2.30.2
> 

