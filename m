Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492EC435196
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 19:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhJTRqq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 13:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhJTRqp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 13:46:45 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07960C06161C;
        Wed, 20 Oct 2021 10:44:30 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id l7so9659849iln.8;
        Wed, 20 Oct 2021 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uSdR0ukf9MlQw9KUu/xtTk/HmpUv660FPwNY/MfGT4o=;
        b=hdFDeDsMdZPC3CyXZupqyaqcQ5EjCtOPqYNwZnwX2knJhX/sWq6/az7oIIDrEBrV/O
         59Apb8EHMcg9E/9F0lGwZ/5JcqbintrbhXJNJZzxO4+aLiwZNPRBj8epO9RpNDQmuiKy
         3myuj3JIHUcKvURcFQZKWyR3Dq+wOYMDODjXia9WpAQyrOH2wY3ZGzKR8k+S+zWTbIWl
         aGjfbpYz0doWKKoR0WMYqHcOIrs7dVhC236M+9c/4oeVXrLA7pK1wLIPzqet/7TY8ZlS
         qm1BY90M4jkJjwmVGXR+LqHDk+K6fGQKeOHp8At0UW6fYQ/a1cC9M0n1v/TM6UpsiSk/
         dvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uSdR0ukf9MlQw9KUu/xtTk/HmpUv660FPwNY/MfGT4o=;
        b=TG2wCXjTnDONNnqnKc+Z3CxP+Bt7b89VtFe/jpVbEj6IMwj6F1uuZqVLv2bCmvdgLd
         4kgOpQjEQk4Cov4S8RER+gcOoARm/SNZRO6g/BTyh7TFeLdqQrbMjB9WUeVrUdfJChWQ
         TRfxov7fgapK+B5Iq00RVEGXwpAUUHZzVvhs4ZHHM9vm3aBM2FvE1M/lIzP+XcyqtPf3
         f1f0ksLJtb2Prz0yrqFBaSUYWKuIIshExUiQgI9YWrbju1n3RpIL3wZc7a0Fklx8Dg+g
         kWikVE3CffW3KPlUPVVK+a2XP5rIa0Ez+qEv0Ww0QwQWUEzygJj3ODKGEJozrSqu/rdX
         l1GA==
X-Gm-Message-State: AOAM530yOBnvN9Wk0SnoLcnaeadE8sxUoNckofNkFSaUgExFx78xfSJr
        0tJHSAHre3dL+p6/nG48PlMhpwBk4b1HDOScCAdrRZTmCr1YCQ==
X-Google-Smtp-Source: ABdhPJzLXc+w8dZc7PkAAF2DvdK8GG3MKotQo258y6c5dZJtGp1ELkFyLeJXvfxvmuELWtwQ/2tPWq2LzglvyuhuLw8=
X-Received: by 2002:a05:6e02:1688:: with SMTP id f8mr362093ila.72.1634751870235;
 Wed, 20 Oct 2021 10:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211020173554.38122-1-keescook@chromium.org> <20211020173554.38122-2-keescook@chromium.org>
In-Reply-To: <20211020173554.38122-2-keescook@chromium.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 20 Oct 2021 19:44:19 +0200
Message-ID: <CANiq72kCQa7_3JkUqO2=mdj+P2zcjPYJUai0oip5DN7Aaq_ySQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        llvm@lists.linux.dev, Dan Li <ashimida@linux.alibaba.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
>
> +Purpose
> +=======

Sounds good to me.

>  config GCC_PLUGIN_SANCOV
>         bool
> +       # Plugin can be removed once the kernel only supports GCC 6.1.0+

Since we are just giving the major in the other cases below, I would
just say GCC 6+ here (the numbering scheme changed in GCC 5 already).

Thanks for adding the versions, by the way -- this is useful long-term
and not always done for other things...

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
