Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8862B663983
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Jan 2023 07:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjAJGvn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Jan 2023 01:51:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236528AbjAJGvc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jan 2023 01:51:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B077657
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 22:50:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D927D614E1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 06:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C29C433F0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 06:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673333457;
        bh=JBWtwj6d8jxJo3bv+wcdevY8kZYRIKF2HXQNinKvrjU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IvEMLIFo1HXK3QeCl9cbtjVNAL8/YxgmiNythfVHDCPjlqLmeS/Jhe6zUygk8ZAjK
         Xz9751Y9MtBLmWZfkvdGojBRkk+41d3JF2GO2ZWi0iK/ru1ufecmKPZoAu/lSCM7hy
         Kc1co0xwSotFI+eD4KhWLZcWvYUoyr6sAlnSLMFxxn9FKv6kqaZldp8+RS5rVUaKk6
         8zDufsHCCkQRDSI/D8dik7BYVcrAUnRY6RIhLWtHNlu8Xgj8qDVaG3iATH5wlWZBpP
         SU5fSe02MdZiLToQiRdmLuNaBnQFR6C5EDfeAMj16QfrdK1xZ9j7qU0f68o+Q17AAL
         gkjT0ikyc4WrA==
Received: by mail-oi1-f178.google.com with SMTP id s73so428435oie.10
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 22:50:56 -0800 (PST)
X-Gm-Message-State: AFqh2kp9d3yYTpDYwHBGo4LZSgh0qAaW7Ekm7IjROWjfpqGIqKZMa49n
        q/BLe4Q6j541fXD1NoTkDaN2MBhF0faMqrLMgFU=
X-Google-Smtp-Source: AMrXdXu1kckej+kT6FNPKpxwpoIWKqTGdbBDr0j679UvnzNk0pXOWr8cWzoyitlfnf+CI4UtgtA3846arwGgLqhQDJo=
X-Received: by 2002:aca:3755:0:b0:35e:7c55:b015 with SMTP id
 e82-20020aca3755000000b0035e7c55b015mr4339097oia.287.1673333456183; Mon, 09
 Jan 2023 22:50:56 -0800 (PST)
MIME-Version: 1.0
References: <Y7x89C9nAVX98T4g@google.com>
In-Reply-To: <Y7x89C9nAVX98T4g@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 10 Jan 2023 15:50:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASAaqOcLhHLi+fd-b0p=ZTEjCjWAfgZ2=_ShR_0crEQhw@mail.gmail.com>
Message-ID: <CAK7LNASAaqOcLhHLi+fd-b0p=ZTEjCjWAfgZ2=_ShR_0crEQhw@mail.gmail.com>
Subject: Re: modpost warning by default on missing Module.symvers
To:     William McVicker <willmcvicker@google.com>
Cc:     linux-kbuild@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 10, 2023 at 5:45 AM William McVicker
<willmcvicker@google.com> wrote:
>
> Hi Masahiro,
>
> I recently noticed that in commit 4475dff55c54 ("kbuild: fix false-positive
> modpost warning when all symbols are trimmed") [1] you modified the modpost
> behavior to always warn (by passing `-w`) when there are missing Module.symver
> files in order to allow module builds to continue building with warnings
> instead of errors. I'm curious why you decided to not continue to rely on
> KBUILD_MODPOST_WARN to enable/disable that functionality?
>
> I personally find it useful to keep these types of warnings as errors in order
> to catch missing dependencies at build time (ideally by the CI build) instead
> of at runtime when a module fails to load due to a missing symbol dependency.
>
> Let me know your thoughts on this and I'll try to come up with a solution to
> factor in any concerns you have.
>
> Thanks,
> Will
>
> [1] https://lore.kernel.org/all/20210325185412.2352951-3-masahiroy@kernel.org/



Good point.

I think we can always require KBUILD_MODPOST_WARN=1 explicitly.

Skipping unresolved symbols is not a good idea.
Users can proceed if they want,
but they should be aware of what they are doing, at least.


How about something like this?




diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 43343e13c542..34baef239816 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -121,16 +121,14 @@ modpost-args += -e $(addprefix -i ,
$(KBUILD_EXTRA_SYMBOLS))

 endif # ($(KBUILD_EXTMOD),)

-ifneq ($(missing-input),)
-modpost-args += -w
-endif
-
 quiet_cmd_modpost = MODPOST $@
       cmd_modpost = \
        $(if $(missing-input), \
                echo >&2 "WARNING: $(missing-input) is missing."; \
                echo >&2 "         Modules may not have dependencies
or modversions."; \
-               echo >&2 "         You may get many unresolved symbol
warnings.";) \
+               echo >&2 "         You may get many unresolved symbol
errors.";) \
+               echo >&2 "         You can set KBUILD_MODPOST_WARN=1
to turn errors into warning"; \
+               echo >&2 "         if you know what you are doing."; \
        $(MODPOST) $(modpost-args)

 targets += $(output-symdump)









--
Best Regards

Masahiro Yamada
