Return-Path: <linux-kbuild+bounces-8181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB892B12241
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 18:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 101EC5672FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 16:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28A7239E75;
	Fri, 25 Jul 2025 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfDBlPAS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934581FC8;
	Fri, 25 Jul 2025 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753461991; cv=none; b=SNh7STmU0HDYtyBbG/q4lozE24V27LwYlaWeaYRSUNcuZzZPeF+AHuyI9mdPu4UkAv9RLgZiP65GR0rco7bjyPnFeVBPLUp7orcfQdHSNeCv/58QhFnXYFMK0j5BMdmnRbfEyLckDck2/JdVScYyWMHGSLXJ82tuckIDKBN5Grw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753461991; c=relaxed/simple;
	bh=QfpCHcwHlHinm9ZtR/fViVngG0sNf7Ts+uB3ZCh5Xx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPjBZKYoGILFqgmJGAq6jRJoSN4h+H3olpucbK1Wv6Ao9lFfsiIZmGPk71h5s3I5iSD4vboQufOX+ejZrLfBc2D39H8sYbkR7G5+hhoC9t3yzVw1fdvT4z6snPtoC5itlIBV2TAFYIpJeTlpduv3+FBztRHilmxk4asj7UCR2sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfDBlPAS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864CAC4CEE7;
	Fri, 25 Jul 2025 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753461991;
	bh=QfpCHcwHlHinm9ZtR/fViVngG0sNf7Ts+uB3ZCh5Xx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfDBlPASXlIlyZFsABQdJ0MBZXFqFDpZ4v19uM76so5Lf3LnGvL62sFFPOXsJY1Di
	 77ENC5Y+xHf5+f7+h8pgVKM6hYCtOZNneQpJxNf742fty/OmoXMQ4n71XzKwYyDgI3
	 nrsr7Y0XSIKTOo0eBgmRAJjXWKXn5kEVs2tT1WdnMMnJn536HH8ZKXamygOC3GNXe9
	 bXdOJa3s1/K4acl8rXY57hKN4gydNVBhB2tvtjHX74R/NqoQVO1ZfHmx6PNI5P3Es8
	 Feb8oKNp76Zg7CeDnIdRFiLard1U8oTXtFyavDVraSrknpwPg1bGlDS/XXEiohzwWS
	 tPTItG4nJZMvw==
Date: Fri, 25 Jul 2025 17:46:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIO05OZyhjZ5JADT@finisterre.sirena.org.uk>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ptTNb7F4keuuu5CT"
Content-Disposition: inline
In-Reply-To: <20250725161327.GC1724026@google.com>
X-Cookie: Do not cut switchbacks.


--ptTNb7F4keuuu5CT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
> On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:

> > If shadow stack have memory protections from underlying cpu, use those
> > protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
> > stack pages. Hw assisted shadow stack pages grow downwards like regular
> > stack. Clang based software shadow call stack grows low to high address.

> Is this the case for all the current hardware shadow stack
> implementations? If not, we might want a separate config for the
> shadow stack direction instead.

It's true for arm64.

--ptTNb7F4keuuu5CT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiDtOMACgkQJNaLcl1U
h9ArZwf/YMJkuoQ2j9bLF9ONvIrnXY0fItNlrfggfCoxTcY9cRIgb8l8qOxc6uA/
S2sVyA97Le95wnFpBayjCXiFb7F5ooRUS+41Wo4PvG/kTTJsKWqydoQpAZyzQNV+
V1a4cITUFqNi6mYcrEcWzd9RndDfhxXSOaaNgIq2uGgGVMZVXM4LiDqzaP+IS8+y
apL1au6vq87T3R5llhBOzHXr3ot14xeeNfPE9ls3fjM3e0PqhEEXhiljoCKV8szV
18kXUuSAEs1Xpf/WR2dbQj2aWzdPWSm26CT3mIULr+cO93Yczz0oIJqwE8MrykTI
8XzoTTcoH0r8nWPzdxA34nliH8cp6A==
=wvEv
-----END PGP SIGNATURE-----

--ptTNb7F4keuuu5CT--

