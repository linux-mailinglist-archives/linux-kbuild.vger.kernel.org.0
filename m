Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B16966E135
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 15:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjAQOr4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 09:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbjAQOrt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 09:47:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2186A3E61F;
        Tue, 17 Jan 2023 06:47:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B124261483;
        Tue, 17 Jan 2023 14:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F3CC433F0;
        Tue, 17 Jan 2023 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673966863;
        bh=++B34ZebYIFAG4ZStiMrpZS9DbXAx2zJs66DPcYJTB8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qFtcteX0O7Ygxz9pEr96221Hon5IgtieOjqgyZMk/Lo/l61gHRVPVBmratR4uuXbQ
         YO/QQW/3R6cxQKuRdlna5z8HxTbuGnl2XNAZBM6NqAjGPdmJ66/N6irTlyp5aOT4/6
         X4eCc8ib3SlW9IT1pj4+xmHvlf6qagzpbZK7sTUTk3SOmxlYtoHeC0CIyRwQv4/uOJ
         Dt5pQ+TR+doTdNtfBwT9XCUpbYy4djSMU+iAl7awn+Fl7aaiGtHff+G+LSNkX22jfp
         fxqE5tu2vI0vyhsYNoiGJCB12UqhgVuFjoDOQLf61xhV8sruRmCfYogvs6xMo2cGdn
         Z5YYZ8Ylf8UbQ==
Received: by mail-lf1-f46.google.com with SMTP id o20so15466122lfk.5;
        Tue, 17 Jan 2023 06:47:43 -0800 (PST)
X-Gm-Message-State: AFqh2koORbdmCQejX+jKRd/8GBS2P6HQUVcFDWAXmjJOMB7Y4Z6B2Swx
        0ySb4mMl+7gxh7UQkiBUJ4RgVCSWdKGAF3opqqs=
X-Google-Smtp-Source: AMrXdXsMvXqNtX5CDIM1qOiDkgUMBCIa5lmJmPY6e44Otg87l6lsW+AXqzLCi0R5e3gtDSAx5rpXRfwRcN/R1rFVaxc=
X-Received: by 2002:ac2:5931:0:b0:4b5:8ebf:3a1 with SMTP id
 v17-20020ac25931000000b004b58ebf03a1mr151912lfi.333.1673966861510; Tue, 17
 Jan 2023 06:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20230117095946.2042832-1-jani.nikula@intel.com> <20230117095946.2042832-2-jani.nikula@intel.com>
In-Reply-To: <20230117095946.2042832-2-jani.nikula@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Jan 2023 23:47:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNATwevt2GmKVDK7uObHbnwO0g47=aU5rDx05kBQyvfqwUA@mail.gmail.com>
Message-ID: <CAK7LNATwevt2GmKVDK7uObHbnwO0g47=aU5rDx05kBQyvfqwUA@mail.gmail.com>
Subject: Re: [PATCH 1/6] MAINTAINERS: fix kbuild repo branch
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 17, 2023 at 7:00 PM Jani Nikula <jani.nikula@intel.com> wrote:
>
> The MAINTAINERS repository entry specifies "kconfig" as the branch, but
> the repository itself has "kbuild".
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a36df9ed283d..98da2af0a653 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11171,7 +11171,7 @@ M:      Masahiro Yamada <masahiroy@kernel.org>
>  L:     linux-kbuild@vger.kernel.org
>  S:     Maintained
>  Q:     https://patchwork.kernel.org/project/linux-kbuild/list/
> -T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
>  F:     Documentation/kbuild/kconfig*
>  F:     scripts/Kconfig.include
>  F:     scripts/kconfig/
> --
> 2.34.1
>


I sometimes created the 'kconfig' branch when I had
a large batch of kconfig changes, but
8ca5297e7e38f2dc8c753d33a5092e7be181fff0 was
the last time I did that.

Indeed 'kconfig' does not always exist, so I am fine
with this (and rest of the patch set). Thanks.




-- 
Best Regards
Masahiro Yamada
