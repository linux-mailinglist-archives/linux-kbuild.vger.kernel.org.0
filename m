Return-Path: <linux-kbuild+bounces-279-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A830880882F
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 13:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37CE7B21AAB
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 12:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0141F3D0AE;
	Thu,  7 Dec 2023 12:44:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B91122;
	Thu,  7 Dec 2023 04:44:29 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVL0kpKz4xGR;
	Thu,  7 Dec 2023 23:44:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molna r <mingo@redhat.com>, x86@kernel.org,
	Helge Deller <deller@gmx.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Timur Tabi <timur@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	David Woodhouse <dwmw2@infradead.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kerne, l.org@web.codeaurora.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, netdev@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-bcachefs@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH 00/22] -Wmissing-prototype warning fixes
Message-Id: <170195271155.2310221.7822619081586355844.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wed, 08 Nov 2023 13:58:21 +0100, Arnd Bergmann wrote:
> I slightly dropped the ball on this since last sending the series in
> August, but a number of warning fixes have made it into the kernel in
> the meantime, both from my earlier submission and from architecture
> maintainers.
> 
> I have none patches that remain from the previous submission, with
> two of them reworked according to comments. The additional patches
> are from more testing across architectures and configurations that
> I had previously missed.
> 
> [...]

Applied to powerpc/next.

[17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
        https://git.kernel.org/powerpc/c/04c40eed3f7ac48ddaf20104489510e743a53c47
[18/22] powerpc: pasemi: mark pas_shutdown() static
        https://git.kernel.org/powerpc/c/0c9a768de64d24e38e27652b8c273725ccc31916
[19/22] powerpc: powermac: mark smp_psurge_{give,take}_timebase static
        https://git.kernel.org/powerpc/c/afb36ac386783d2ef2ed839293c03fd06f470be0

cheers

