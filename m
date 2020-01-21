Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE1E143A9B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 11:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbgAUKO1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 05:14:27 -0500
Received: from mx2.suse.de ([195.135.220.15]:57432 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbgAUKO1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 05:14:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 47FB1B2C9;
        Tue, 21 Jan 2020 10:14:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20200121100150.31660-1-geert+renesas@glider.be>
Date:   Tue, 21 Jan 2020 11:13:56 +0100
Cc:     "Geert Uytterhoeven" <geert+renesas@glider.be>,
        "Arnd Bergmann" <arnd@arndb.de>, <linux-kbuild@vger.kernel.org>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Masahiro Yamada" <masahiroy@kernel.org>,
        "Eric Anholt" <eric@anholt.net>,
        <bcm-kernel-feedback-list@broadcom.com>,
        "Gerd Hoffmann" <kraxel@redhat.com>,
        "Will Deacon" <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: bcm2835: Drop select of nonexistent
 HAVE_ARM_ARCH_TIMER
From:   "Nicolas Saenz Julienne" <nsaenzjulienne@suse.de>
To:     "Geert Uytterhoeven" <geert+renesas@glider.be>
Message-Id: <C01E1Q2TFG55.35B3FH1ISNZQO@linux-9qgx>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue Jan 21, 2020 at 11:01 AM, Geert Uytterhoeven wrote:
> Unlike on arm32, the HAVE_ARM_ARCH_TIMER config symbol does not exist on
> arm64.
>
> Note that the toplevel ARM64 symbol always selects ARM_ARCH_TIMER, so
> support for it is always included.
>
> Fixes: 628d30d1ccb897fe ("arm64: Add platform selection for BCM2835.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks,
Nicolas
