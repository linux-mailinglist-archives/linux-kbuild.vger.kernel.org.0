Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CA36633BE
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237418AbjAIWPW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235601AbjAIWPV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:15:21 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0226E1083
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:15:21 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id jn22so11103979plb.13
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 14:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cWcEmZiis3k81rHkzEa0Ff5rOGDEfrLjYKHcyZUOVd0=;
        b=aQYQYh0zZly02xM2q0Kz4/tJhJBCKKnDiLV+255pEkAT+/cIwpUBATajSVjChmEW6b
         e03d7uMeLF3XO9SU436g/wLBcqJj00bnWeoVigfzsAsV+03QRrwDRooZVCCt4xRxQBz4
         mDhVg08QMtBUu9x5a67qMtXDIoPQJdkZxXnD7cMkZQlG0oKjhE7yb/0WvOaeWvbekmsx
         dig7iYo3KJ4dIlSaJPih4o9OOkoI+reok/9JWhy8fMnteXScwZOsP7rtvuSdUXom+FA5
         XDuGo6UFaTMp7Jb03Sbd0YyNLvYS0C49ZmjFtAd1RNTwAVc2W/qibwoBS8C6Y/WhN4qs
         0cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWcEmZiis3k81rHkzEa0Ff5rOGDEfrLjYKHcyZUOVd0=;
        b=wUvXJOtal6GLHbodkA1IMjxWNL+hB99Mm/yhvx1WtUAwixD1vcGcwNABZK33p5aTCQ
         m8l9XW/WCJerSnMNBAQp1dZE85Ove1yn/2ARpigQJ1GnBmUjyYsHcxDf28NCpHmaZo7u
         TEVFBxo+0MeGKD38BzOjI4twBGOrwsyqUXWOCBomsTpL6mOHVGlXXOelLxeSG+E7xo1t
         20RAqhPIddNV0FHhz0pIQmSpL8cs5MCZlc1XsNLyIF5ttZbS+HyEqlhRrEQLLJkzNEM9
         lGX+91EvL0uU68ixcYaxiemm8uMxPAL0DSS/3mDUTvzECeVpwPKqkB5K7wtZEHSO7dIL
         aNkA==
X-Gm-Message-State: AFqh2kpVfft/Lz61rhX0o5tszkpJrBrdl/UgtDTMjIiinikCqIWrcJ3K
        emUGcwF+NxUh+qkE3I6Yqv+74DZvtu5EAI7X/oZ6gA==
X-Google-Smtp-Source: AMrXdXvSPOwVjOCrhguWVpzIUlUMdttiuizEXtJFfgxCI3UH4Bv6pmx/fTGssGsMzUohUgJr5iXSG8wohLXJd4lJ15w=
X-Received: by 2002:a17:90a:488a:b0:226:b5f4:d420 with SMTP id
 b10-20020a17090a488a00b00226b5f4d420mr2188050pjh.102.1673302520314; Mon, 09
 Jan 2023 14:15:20 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-13-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-13-658cbc8fc592@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 14:15:08 -0800
Message-ID: <CAKwvOdnaXkHe4bJyD9LGfWj6rX4DVO_0J1U_eH3wJX5kFiOYBg@mail.gmail.com>
Subject: Re: [PATCH 13/14] kbuild: Turn a couple more of clang's unused option
 warnings into errors
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Currently, these warnings are hidden with -Qunused-arguments in
> KBUILD_CPPFLAGS. Once that option is removed, these warnings should be
> turned into hard errors to make unconditionally added but unsupported
> flags for the current compilation mode or target obvious due to a failed
> build; otherwise, the warnings might just be ignored if the build log is
> not checked.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1587
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.clang | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 87285b76adb2..70b354fa1cb4 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -36,6 +36,8 @@ endif
>  # so they can be implemented or wrapped in cc-option.
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  CLANG_FLAGS    += -Werror=ignored-optimization-argument
> +CLANG_FLAGS    += -Werror=option-ignored
> +CLANG_FLAGS    += -Werror=unused-command-line-argument
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
>
> --
> 2.39.0
>


-- 
Thanks,
~Nick Desaulniers
