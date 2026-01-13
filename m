Return-Path: <linux-kbuild+bounces-10571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5CDD1AA66
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 18:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCA663007F0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 17:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AD22FDC55;
	Tue, 13 Jan 2026 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WbyA3+Fz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E489D1CD1E4;
	Tue, 13 Jan 2026 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325643; cv=none; b=pf2xm8Kjjq2VAcPf8Mx8MInrIib9MShGlm3yAL2whotM3YMAZGnjgaYRM9D+eJCRbkbSILZtFAeEbVpucOIxfj0D5KoZyr2ByVPVue761PiXDZ6OoAifeARK1pNMUws14TCRnON3QEuMuOqVDDLRtvAL3vzEF955JvipN5Rxrko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325643; c=relaxed/simple;
	bh=YZwbcRRPs13mP8+rij8yZTXdw99Dd9eLfldfmPqX6MI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=m3muBAnRfUy3kAhG+bmfzh1hKraZOpEvN7W6efoNKr/PRAMP9HijIZlVFkFD+fQWol6H0dEsMOBDnd4x6q/3AXB1XLSNsxl9lYIBPldJVo424v7EBRCXTKK0E4w5FDR/XI9pPVYqORt9PueZd+gyxqZrnXyRQo+UNMlpnrUXHJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WbyA3+Fz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7658C116C6;
	Tue, 13 Jan 2026 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768325642;
	bh=YZwbcRRPs13mP8+rij8yZTXdw99Dd9eLfldfmPqX6MI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WbyA3+FzTYTAmHvwVlZfLUe40KQDNlYCOwODqmT24UnodE6me2UXyfdkbMRcgiM2A
	 Ie7nNf0bhgBJqvjW6G7/jpya3q2bjnOxZm4JHG8oFsLRnvEoKeoDSzoMF0+3t4TFR5
	 ZgzaiDm3pu+lQM1rrx41GzTtPJgJ5q3yEJ2FLXuA=
Date: Tue, 13 Jan 2026 09:34:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, corbet@lwn.net,
 morbo@google.com, rppt@kernel.org, lorenzo.stoakes@oracle.com,
 ubizjak@gmail.com, mingo@redhat.com, vincenzo.frascino@arm.com,
 maciej.wieczor-retman@intel.com, maz@kernel.org, catalin.marinas@arm.com,
 yeoreum.yun@arm.com, will@kernel.org, jackmanb@google.com,
 samuel.holland@sifive.com, glider@google.com, osandov@fb.com,
 nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org,
 Liam.Howlett@oracle.com, kees@kernel.org, jan.kiszka@siemens.com,
 thomas.lendacky@amd.com, jeremy.linton@arm.com, dvyukov@google.com,
 axelrasmussen@google.com, leitao@debian.org, ryabinin.a.a@gmail.com,
 bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com,
 urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com,
 andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org,
 vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com,
 samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com,
 surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
 yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com,
 kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org,
 ardb@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for
 x86
Message-Id: <20260113093400.412cb4c5596ff3336ac803fb@linux-foundation.org>
In-Reply-To: <20260113114705.GJaWYwubl3yCqa1POx@fat_crate.local>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
	<20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>
	<20260113114705.GJaWYwubl3yCqa1POx@fat_crate.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jan 2026 12:47:05 +0100 Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Jan 12, 2026 at 10:29:57AM -0800, Andrew Morton wrote:
> > The review process seems to be proceeding OK so I'll add this to
> > mm.git's mm-new branch, which is not included in linux-next.  I'll aim
> > to hold it there for a week while people check the patches over and
> > send out their acks (please).  Then I hope I can move it into mm.git's
> > mm-unstable branch where it will receive linux-next exposure.
> 
> Yah, you can drop this one and take the next revision after all comments have
> been addressed.

Cool, I removed the series.

