Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBABA73C080
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 22:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjFWUkV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jun 2023 16:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbjFWUkI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 16:40:08 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0922955
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 13:39:30 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-40092be7bd5so796821cf.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687552763; x=1690144763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtZOBLXx1qaVh8dEPlOQudc9UC+Jo33p6yGPUYlrsSo=;
        b=DjWYIE/gzUN0Iiva7mkvSSuTrCrrIFG8+k9bfhLiENXZkHv0LSIRyQV0CuChbMfFTm
         4XSOIKNbfzd17E1SrZaTFUnAK5r2Xto887LdsWzt0fv8zc62b52Q8Z2eUB00mpYhgcRO
         bWbHk+wzyFGPDcE3AVUhrqiEWJwLl8WMKYzfzcDRLojb49S4oKYZNbBs7c/tsEfEKjyz
         Iay+x8Z6UtF/8ZP5ziuj5VMwzouWdrJ6SIbaqVPE5JnHoUibJhC8vHHs0fCZyvJjAiZR
         DRuJ0HBURTHIY6tpRH7FpoYKCTsR01ENJ31VSTIKCGbqZKIlZgfL2p7cvhAN4WZLqRBr
         n50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687552763; x=1690144763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtZOBLXx1qaVh8dEPlOQudc9UC+Jo33p6yGPUYlrsSo=;
        b=j2m3Setec78446dW4zAV1s2fBl+jXEfoEM9KBOpl1Y6VvwORDD5bq38BslWKVHlFGy
         BoKENw/wZxccfGbY1Li0BrmZd52pCNz6BOIXFsY0Gbv+YWzgaeeOQ9PxGXboruUImVrF
         1eN2d1f0KDu9jlNCv5Kd+xI6GxIBEDepfK8YWyrl7Ry5kJlp4BtCsEK1re/9ny6haUfF
         SdRFiQVZidIrQbqU1/k4mH5ljC+kUlkaxfeLKwrsS9NCUTTFSWRYqGkbsI4DSXUphCjq
         YoZ5+Ad2jxqW41ZtSQvrvTdulArkiXApS8Sp2g+EbYDnXnqC1lECGpSScv9YauiYfgb5
         oQUA==
X-Gm-Message-State: AC+VfDx9wELPPoHHUlcS27mDGxQs++TYK8s7ZuIJ1b4z18MBV9tnpggL
        OWGc+vp1lLOZcy6H25v2u5GmwRrnuverDyp3AQXO+A==
X-Google-Smtp-Source: ACHHUZ5C+T2n2aljTSPuz46L0evX9FbO0qx+MAMVKiVyMT4wrARHms0ylsHGzLcHQiWlg0CE6es1Md6wWggP55Pgz9w=
X-Received: by 2002:a05:622a:1708:b0:3fb:426f:19c0 with SMTP id
 h8-20020a05622a170800b003fb426f19c0mr29888257qtk.29.1687552763059; Fri, 23
 Jun 2023 13:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230623001140.1111494-4-samitolvanen@google.com> <202306230932.539C9DC0@keescook>
In-Reply-To: <202306230932.539C9DC0@keescook>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Fri, 23 Jun 2023 13:38:45 -0700
Message-ID: <CABCJKufmB+MwjEu=wjina1-F0q9vT--ig=SyLAGuXQViLV_1Uw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix CFI failures with GCOV_PROFILE_ALL
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 23, 2023 at 9:32=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Fri, Jun 23, 2023 at 12:11:41AM +0000, Sami Tolvanen wrote:
> > Hi folks,
> >
> > The following two patches fix CFI failures with GCOV_PROFILE_ALL,
> > where the compiler injects indirectly called functions to object
> > files that otherwise contain no executable code, and are not
> > processed by objtool or don't have CFI enabled. This results in
> > missing or incorrect type hashes during boot and when modules are
> > loaded.
> >
> > Sami Tolvanen (2):
> >   kbuild: Fix CFI failures with GCOV
> >   kbuild: Disable GCOV for *.mod.o
> >
> >  init/Makefile             | 1 +
> >  scripts/Makefile.modfinal | 2 +-
> >  scripts/Makefile.vmlinux  | 1 +
> >  3 files changed, 3 insertions(+), 1 deletion(-)
>
> Nice hunting!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> Should these get Cc: stable tags maybe?

I was under the impression that Fixes: tags would be sufficient these
days, but agreed, explicit Cc: probably wouldn't hurt.

Sami
