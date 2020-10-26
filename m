Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AE1298F1D
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Oct 2020 15:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1780815AbgJZOWM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 10:22:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1780771AbgJZOWM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 10:22:12 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E21E2463C;
        Mon, 26 Oct 2020 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603722132;
        bh=XTmFVFF/1IJi9VNxcHobU88J4tjKGnqEEgh81n1ulls=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rkehNneu2VWuTn3SP+g4mMx9+x39HUQdz+P4gHs9WQxXPkfnWSOKsemQR+xX0+2iz
         povzBvbkvJcm23LurShpuMX//MKOsWjOtBlYlmYaOk3Q4B4WxrPJFVBZ6xJ/7n9Ooa
         YhyOCXddGyHZfGgOA/ZWk6oqwQP0n6hknnIXWrrU=
From:   Will Deacon <will@kernel.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        clang-built-linux@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] arm64: vdso32: Allow ld.lld to properly link the VDSO
Date:   Mon, 26 Oct 2020 14:22:06 +0000
Message-Id: <160371826139.658538.6694250403210867062.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201020011406.1818918-1-natechancellor@gmail.com>
References: <20201013033947.2257501-1-natechancellor@gmail.com> <20201020011406.1818918-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 19 Oct 2020 18:14:07 -0700, Nathan Chancellor wrote:
> As it stands now, the vdso32 Makefile hardcodes the linker to ld.bfd
> using -fuse-ld=bfd with $(CC). This was taken from the arm vDSO
> Makefile, as the comment notes, done in commit d2b30cd4b722 ("ARM:
> 8384/1: VDSO: force use of BFD linker").
> 
> Commit fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to
> link VDSO") changed that Makefile to use $(LD) directly instead of
> through $(CC), which matches how the rest of the kernel operates. Since
> then, LD=ld.lld means that the arm vDSO will be linked with ld.lld,
> which has shown no problems so far.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: vdso32: Allow ld.lld to properly link the VDSO
      https://git.kernel.org/arm64/c/0fa97e9403c7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
