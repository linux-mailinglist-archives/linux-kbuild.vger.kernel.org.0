Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68ABA39F7B4
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jun 2021 15:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbhFHNYB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Jun 2021 09:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:57644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232934AbhFHNX7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Jun 2021 09:23:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01E986124B;
        Tue,  8 Jun 2021 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623158526;
        bh=26tDlzaqRmpxPofcTFO2IiT4LsDm38K8gdTl72KaM3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lyKsXvu9MbIV9BLRfCaGTCFEbW+1ah5q9kIPXSui1PlBDI6v5i2WhAUGGMHUgVq6J
         8mPWn6F55uT4x1VF9iOzYelAgi0ZP4NGcrx4c+hBhFm2SKflqh/RCgreANi3Vzs4c7
         GQPQxqfWQjVji0VPcmXwvyQItBFaln+IrQ/UQrbvWznzxiQOvGmdCHfTWH5S8g3ipn
         AoVHqaYUEofmYohF6AYN3QT9iexXo+Fju6/ROT5zHu1LHDBmf6LZYOXvqsTO47dhUL
         bXido5hBepcu8JK6KtiZiCkF4XqP+Nf2/w++gduwAP+dsChBl8d5RvTMJW2uFRsOKF
         RkSN9qgHqfIPA==
From:   Will Deacon <will@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Peter Collingbourne <pcc@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-arm-kernel@lists.infradead.org,
        Elliot Berman <eberman@quicinc.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Makefile: fix GDB warning with CONFIG_RELR
Date:   Tue,  8 Jun 2021 14:21:53 +0100
Message-Id: <162315417458.2255276.14036371169273697927.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210522012626.2811297-1-ndesaulniers@google.com>
References: <CAK7LNAS_LpZnweujqVwZ1kL0eDYR726k35U_yx1djqNE0bk6Rw@mail.gmail.com> <20210522012626.2811297-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 21 May 2021 18:26:24 -0700, Nick Desaulniers wrote:
> GDB produces the following warning when debugging kernels built with
> CONFIG_RELR:
> 
> BFD: /android0/linux-next/vmlinux: unknown type [0x13] section `.relr.dyn'
> 
> when loading a kernel built with CONFIG_RELR into GDB. It can also
> prevent debugging symbols using such relocations.
> 
> [...]

Applied to arm64 (for-next/build), thanks!

[1/1] Makefile: fix GDB warning with CONFIG_RELR
      https://git.kernel.org/arm64/c/27f2a4db76e8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
