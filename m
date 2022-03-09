Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D8E4D270F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Mar 2022 05:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiCIBRo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Mar 2022 20:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiCIBRc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Mar 2022 20:17:32 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1232DDEF0
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Mar 2022 17:07:10 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id l20so994210lfg.12
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Mar 2022 17:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYmupwL1NthFsF42+Fr0z4aIrhKGW9iSWfQCfyDDaEk=;
        b=T9Y8CKYiSW3hGc9HM0/MT5sFo5blD99UIhMWcRbFD5kggM3DUwxybXuISqMFUGIjrg
         mWQ74CDHtfn9kXLqt5VqIvjs1zPAj3pO65tEdbgr+OX1FrAEaiMiYghKLtQSRfh7w9WS
         TgKR2SZWDkmK6Hkv45V1e1kyBDZQ0M8AOrIp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYmupwL1NthFsF42+Fr0z4aIrhKGW9iSWfQCfyDDaEk=;
        b=SgXA383eg/76gh/zuUsFKrXF8Sctk+QkZsOM6XDk62Lg3NOXy7THaKmW0oRiGZdWqr
         IuYxlBuuaSSUbUOTBbep+tC/zXr6cJ0bocU422oP5ZzoDNsb+u5yNjLCnAiz2kE2Yjxw
         +A0RhdrmIGR6ZNxJnCQIlSVgFSAL39ieq6QgDBkzLJN2O/qgTnKV9y7xQGDQINCLboUD
         +lHAwohO2IAsNQ4sn6FwsXofNpmwqnbZGij4yKX8ZTVXi8iAls3haKAbk0YMmWzKnFRH
         fkVoybaydqT16AkZDXfnyUT/YBZbH+Rg0mVuyC1+1rZmjyolBcEUqqU4cQd6b7NUNWVn
         N47Q==
X-Gm-Message-State: AOAM530uR0Oq/wXWYlWT5aRRyRM1V3bmamavVCS9tPbWiZZlQFt39QsH
        8O2B1MdKsSISKv3gM+ukL18SdySX3tG9OSKfP8w=
X-Google-Smtp-Source: ABdhPJx8K9uUanbmEn0hjOAzghgTI35rfmMcMX5PtReswi/HtViT9K/p5ZS0IXDwtlqKbfWcI/uPdg==
X-Received: by 2002:a05:6512:400e:b0:447:5d84:c40 with SMTP id br14-20020a056512400e00b004475d840c40mr12162682lfb.591.1646784570866;
        Tue, 08 Mar 2022 16:09:30 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id m25-20020a195219000000b0044846bbda49sm62388lfb.121.2022.03.08.16.09.27
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 16:09:29 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id s25so851989lji.5
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Mar 2022 16:09:27 -0800 (PST)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr3400178lji.152.1646784567653; Tue, 08
 Mar 2022 16:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20220308215615.14183-1-arnd@kernel.org>
In-Reply-To: <20220308215615.14183-1-arnd@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Mar 2022 16:09:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
Message-ID: <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] [v4] Kbuild: std=gnu11 changes
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Alex Shi <alexs@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        David Sterba <dsterba@suse.com>,
        Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 8, 2022 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I've incorporated the feedback from Masahiro Yamada in this
> version, splitting out one more patch, rebasing on top of
> the kbuild tree, and changing the order of the patches.
>
> Please apply to the kbuild tree.

I'd actually like to see this as a separate branch, so that I can
merge it early - or other peoples git branches end up depending on it.

Yeah, it shouldn't change anything on its own, but since it allows for
new syntax, we might have other things depending on it (I'm obviously
thinking of the list_for_each_entry() series that keeps getting
posted).

                      Linus
