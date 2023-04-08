Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36AEC6DBB4C
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Apr 2023 15:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjDHNtt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 8 Apr 2023 09:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDHNts (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Apr 2023 09:49:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97FD1BC6;
        Sat,  8 Apr 2023 06:49:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C4076142E;
        Sat,  8 Apr 2023 13:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95475C433A0;
        Sat,  8 Apr 2023 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680961786;
        bh=rpFTrTpcNVbSF0vqVoyh7L6giVIN41C6RAvl7FyFd6M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uYTTzr+VaSdylukWPgMXvbabqMmFJFBelvAVKNtGkkIMZ1pFQpTdcJneODqdlGLIC
         NMm7/KkuKUJWf9AVIqyZCJ2fIaa0JgZ/qXBwsUoT3Gj+H6WkbGwYTbAkhnSr9MWkn5
         RNh7d3QhL0cDEaelZ72nYpNXOCt9XG318tFjcgIWryvfP1lII8xCWiSDjzsmXUxVjw
         79qFqh7GdiF3LkqIAnY5nPV7i1tT09Gwn3OUlvyKP0/b4vbRrYfx2D8dYcdi0rjtgV
         9eWLZa/L9fT/XjtG5jSzK+FIxrV0bOiWfAW1PoHI4q6Kvjy/KSaEJP5IyIkg1ebQ2h
         sfoKlbVKZJgHQ==
Received: by mail-ot1-f49.google.com with SMTP id c2-20020a056830348200b006a3ab0ba8a2so4912747otu.1;
        Sat, 08 Apr 2023 06:49:46 -0700 (PDT)
X-Gm-Message-State: AAQBX9cc8dHgZ0LgdHIcZ7i+PDyfBJrg4lzU0Se4N7UegP0QmdXpEgsH
        dT+2zWaq/7+6X9KYlr8GCKQrR5SRKIzefE8hh7w=
X-Google-Smtp-Source: AKy350Yym8k/APtYBId7w0JsijjhyT7A4owCM9aPZto2PhafU7XfDKW9u3WGQU/uDgTbGtERYGu0UOkevabdF/37QBs=
X-Received: by 2002:a05:6830:130a:b0:69f:8da4:48d with SMTP id
 p10-20020a056830130a00b0069f8da4048dmr1361134otq.1.1680961785939; Sat, 08 Apr
 2023 06:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-korg-llvm-tc-docs-v2-1-98d2e4a96c41@kernel.org>
In-Reply-To: <20230405-korg-llvm-tc-docs-v2-1-98d2e4a96c41@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 8 Apr 2023 22:49:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9NjtgJip-ZuSrvFX6+zkF7XA7XewS7w+_hogB2F1x6A@mail.gmail.com>
Message-ID: <CAK7LNAR9NjtgJip-ZuSrvFX6+zkF7XA7XewS7w+_hogB2F1x6A@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/llvm: Add a note about prebuilt
 kernel.org toolchains
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     corbet@lwn.net, arnd@arndb.de, keescook@chromium.org,
        ndesaulniers@google.com, trix@redhat.com, nicolas@fjasle.eu,
        llvm@lists.linux.dev, patches@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 8, 2023 at 6:43=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I recently started uploading prebuilt stable versions of LLVM to
> kernel.org, which should make building the kernel with LLVM more
> accessible to maintainers and developers. Link them in the LLVM
> documentation to make this more visible.
>
> Link: https://lore.kernel.org/20230319235619.GA18547@dev-arch.thelio-3990=
X/
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Bill Wendling <morbo@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>


Applied to linux-kbuild/fixes.
Thanks.






--=20
Best Regards
Masahiro Yamada
