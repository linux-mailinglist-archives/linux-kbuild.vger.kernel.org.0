Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4FC2C2B9F
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 16:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbgKXPmd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 10:42:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:44518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728429AbgKXPmc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 10:42:32 -0500
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0145420715;
        Tue, 24 Nov 2020 15:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606232552;
        bh=UZFHIvXXCKDphUbStujOKhrv+nRc7B6JfoLplsr7SRQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QHKwg8nzv/+9BVTCW0wJNt0aB4pPKBy/fzEjI5vLR8XcFXF49pAyjPacN3Qiu0SsJ
         CCS8CFLeri74hdzHKgx+FfWK8ekM/fsFZX00qN7VowGP0kt15y2lPvwby2RT/nl1y8
         orZFxXOD8WBRNrM11A8TcYvOQP+dhVeRw/qQ+sok=
Received: by mail-ot1-f42.google.com with SMTP id n11so19724746ota.2;
        Tue, 24 Nov 2020 07:42:31 -0800 (PST)
X-Gm-Message-State: AOAM531VSxa7i8jcqRXt1P6Mp/q15ZpKPnrjoI5rAs8Zkt+gSuUSVv07
        JQBlD+z/lEG9QYCSHZ/VymOhhr5I2saT+84h3W8=
X-Google-Smtp-Source: ABdhPJx9rc+/Tn9RKkmrfKMeK1DTuBFAexsPUpHnjo8or444i6n/2eobMJtWTt7278CySbwLXMJmbRZ29gMVm38JvqM=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr3464481otk.251.1606232551258;
 Tue, 24 Nov 2020 07:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20201026220331.3896226-1-arnd@kernel.org> <20201027014219.GA4058050@ubuntu-m3-large-x86>
 <CAK7LNARSn8D_0Gq3072SrD5ijzaqjLGxN=ttLZp5ay-G+adFUQ@mail.gmail.com>
In-Reply-To: <CAK7LNARSn8D_0Gq3072SrD5ijzaqjLGxN=ttLZp5ay-G+adFUQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 24 Nov 2020 16:42:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3xXtMjTQxhsSNxb5cE6xTpH_+XV-6RqS+cRRh3RoJ3Kw@mail.gmail.com>
Message-ID: <CAK8P3a3xXtMjTQxhsSNxb5cE6xTpH_+XV-6RqS+cRRh3RoJ3Kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile.extrawarn: move -Wcast-align to W=3
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 23, 2020 at 12:18 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Applied to linux-kbuild. Thanks.
>
> But, I think people already tend to ignore W=2 warnings.

Yes, this is what I was trying to change with this series and a couple of other
patches I sent. When all the warnings from commonly included headers are
gone, W=2 actually becomes somewhat useful.

      Arnd
