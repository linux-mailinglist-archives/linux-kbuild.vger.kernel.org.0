Return-Path: <linux-kbuild+bounces-6927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ECEAA8D0B
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 09:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8979416C920
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 07:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751D81993A3;
	Mon,  5 May 2025 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="C0BETl3H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307371C84B3;
	Mon,  5 May 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430246; cv=none; b=gKiPPyWvpKKeJkLqwTq3qS6pSMyA4ZkLWsh67C78e+RUSHIJPxQu7MC4QRHP9gX9HRJ9a9s5py9G5gnPVAkEEjCIWgqnKwKCN+sJbs2W+KifqjxYBkug0BJ2d/UNAMLeAFvToy0vvstjo+w2F8KneKEz9g5xolvfp7Is6W4qwp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430246; c=relaxed/simple;
	bh=YryKvQ1nIFLnXzH0TxCdQBQxjXBGgZILAGT9RFPjNA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9BdJFOveE0sxoTrTw5ArZAxVlDGC9e/tdBJAlNDP0ePx8nH7L1Bg4ujd7OoKYq0sr47leQwDRtl+GpGBqHFKeAinAvZnCBAMaIOhAuWAsT2hPwYeWHTmaOjSXSt3vkU1hZldCw/SZWoZEjapbCdxSxxvXVxT1H7oCWqS0IPgqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=C0BETl3H; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746430232;
	bh=YryKvQ1nIFLnXzH0TxCdQBQxjXBGgZILAGT9RFPjNA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0BETl3HfmGFUdSzIC3FvL7IZAB7DuFHkqWfS1CRDmK3yqa7aCEZpdPrVl2FhnIy5
	 zioclXleHpTOzjiSgiLaSIomsfiKf4o5aQxRKI8ZsggiRf7toPnWP0+KufAyM9AMq9
	 eB96fu5Bg3NmA+cyGawWx41OqiNdZCR22jMgJ4R4=
Date: Mon, 5 May 2025 09:30:31 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: make all file references relative to source
 root
Message-ID: <5e996ded-2325-48b5-9cde-972b70e0934a@t-8ch.de>
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
 <aBEttQH4kimHFScx@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBEttQH4kimHFScx@intel.com>

On 2025-04-29 22:51:17+0300, Ville Syrjälä wrote:
> On Sat, Mar 15, 2025 at 02:20:14PM +0100, Thomas Weißschuh wrote:
> > -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> > Other references, for example in debug information, are not affected.
> > This makes handling of file references in the compiler outputs harder to
> > use and creates problems for reproducible builds.
> > 
> > Switch to -ffile-prefix map which affects all references.
> > 
> > Also drop the documentation section advising manual specification of
> > -fdebug-prefix-map for reproducible builds, as it is not necessary
> > anymore.
> 
> Hi,
> 
> This broke 'objdump -S' completely for me.
> 
> I see the following difference in the debug info:
> -    <12>   DW_AT_name        : (indirect line string, offset: 0): drivers/gpu/drm/i915/i915_config.c
> -    <16>   DW_AT_comp_dir    : (indirect line string, offset: 0x23): /home/.../src/linux-2.6/build
> +    <12>   DW_AT_name        : (indirect line string, offset: 0): ../drivers/gpu/drm/i915/i915_config.c
> +    <16>   DW_AT_comp_dir    : (indirect line string, offset: 0x26): /home/.../src/linux-2.6/build
> 
> Looks like I can work around it with some combination of --prefix and
> --prefix-strip, but that seems far too tedious to have to do every
> time I need to decode an oops.

Yeah the --prefix and --prefix-strip mechanism is only an ugly
workaround.
Unfortunately I don't see a nice for this issue at the moment.

Masahiro, could you revert this commit for now?
I'll try to come up with something better.


Thomas

