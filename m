Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C16282B32
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 16:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJDOWU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 10:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDOWT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 10:22:19 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926F2C0613CE
        for <linux-kbuild@vger.kernel.org>; Sun,  4 Oct 2020 07:22:19 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id d197so6540450iof.0
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Oct 2020 07:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=vEy97O9XPqj9CvO8D1pr4Yw3kKqg9uV7eLg4anVrDg8=;
        b=ZmLD+dkJJrRK2quhmiAUNW9EQ5MRZA2OKJDlQjqFe+k6wuRf3ChnNfKQjyXglb7jHC
         652TQJGdUjQwJvZ6a8iqm+jPFPDxItJDn5q8nlI+2benPH7b+eT3dr82wHNdwbuzTIn5
         JNO/DX4hVGyMGLZi/SsOb+wJrt/zsXZR/uQ2GTvhjd5YiGVVLsmcx3PrvEzdyjfcoOa6
         BIN27bAvw1XUIOLZIVsXnoMgpgCqiC3GkdeisU3kvL+jPmTPb8fsoCA0cmquwNiu0E3z
         c1PKhd3zpdWtru3O80ZMJO5AVAMPUNp7EzEhqS1ei+Pcz2o0Ei2wU3kkFwFrZKc0RvWJ
         sNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=vEy97O9XPqj9CvO8D1pr4Yw3kKqg9uV7eLg4anVrDg8=;
        b=FeoUeA41grO9l5OPN3JKU4NMN7FFMPng7HonzjFmPFOkDzVVsW5Bqf53QBwtNk4ttn
         zBgnMXaWGtMblcQHNzzfRaVmB/PvQXnMzGZFjLNjpfZktZNqtDB8KK9O/8CzlBSxUzJG
         MoCseH8q8M9DiXGyu/wYBsti9Roo0jk87fmEDi+yh91ccH9YpFLrHXYvOaByoS2xjj9F
         erDfivFMD2cTGR0TvAppqq89Ura0XRqoFFot5Ayux6v1CXxA9XGsIdwiQ+R42u+SBZFt
         kKwLQs4D32o1sNSuOXu9Mj8MNwAvwZNqCI/CcNHbPR8ul01B5JgeXLED1zTiX6Gyb3Qy
         a5Nw==
X-Gm-Message-State: AOAM5302QcDN2Vxfp52AIGQPC3N3rhqqH4JOfR/zr7tnWmRKoT/q7os/
        J57l9K/PcsOgTB4jfIydyMC6VMeGWr5JaCnbE8qnk/N5MSIH5Q==
X-Google-Smtp-Source: ABdhPJx2/6py/iketeoquONoCsCwRMCduLfjexLwM5ic3XcF2iVN9ifLiPlWx5dLb64awO7BTVnm1aAOhq5RKrlJgbE=
X-Received: by 2002:a6b:7c0d:: with SMTP id m13mr7711557iok.57.1601821338806;
 Sun, 04 Oct 2020 07:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUUss+XGHxtSXB3WaRLODdQ0-Ln03N45NUQ=QaP49O3e0A@mail.gmail.com>
 <CAK7LNARes+EEjue1ZNXZrKjWLjkv76NwEUyo_S6F3d=gni9XSA@mail.gmail.com> <CA+icZUWAYBSmBBcBSkGso45n=jmehEv2SUxJ13kCqHF+Qi8yCw@mail.gmail.com>
In-Reply-To: <CA+icZUWAYBSmBBcBSkGso45n=jmehEv2SUxJ13kCqHF+Qi8yCw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sun, 4 Oct 2020 16:22:07 +0200
Message-ID: <CA+icZUW6r-jUGOOW7s18hN-isijC__4vZtSCmLMZqKH+0_UzSg@mail.gmail.com>
Subject: Re: Linux-5.9: Remove CC_FLAGS_USING via asflags-remove
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Both work.

[ lib/Makefile ]

ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)

#1:
ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -DCC_USING_NOP_MCOUNT

#2:
KBUILD_CFLAGS := $(filter-out -DCC_USING_NOP_MCOUNT, $(KBUILD_CFLAGS))

- Sedat -
