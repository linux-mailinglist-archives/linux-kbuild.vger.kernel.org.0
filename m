Return-Path: <linux-kbuild+bounces-1145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F186FDB6
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 10:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F9091F2091B
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 09:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6393323758;
	Mon,  4 Mar 2024 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="nZ6fOuSx";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="my65UINs";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="44xz7tw8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i652.smtp2go.com (e2i652.smtp2go.com [103.2.142.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB923747
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544468; cv=none; b=urb172EY2kCqcGRiP+3d0qYr/nQBPTm+95Hu0wwluD9GOy/OqO3ZkcLoW6vP/O6MPme/gr1p/NA1M2iGYypMHah2uFB/qbQ7vQ4a1miS3EZNY4YcltgHgzWZzruXWSJC5E1BKB9LO+X/XrU9F2xjOsNfMAWALv5gBucwARx0cMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544468; c=relaxed/simple;
	bh=QmqJ7UhtuVE/HMfCaaiIwMG4Sf8WNDWahWxOP3KDP1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1bKnuPD8JiePNaa9rr1nfEyHPtdCxVTdn7u3f1u/rmCNYBNpDtp4VtGcBfA/Lz9xYhSl2Y3hrwl6YNJlKK5YMIflgvJ/fy+cyjzSVp13RHjKzLzG/eXzX92cOEvTRGIcK1KayPEiHKN94ilMloQodDDJYKp0lLQjACztEqqV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=nZ6fOuSx; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=my65UINs; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=44xz7tw8; arc=none smtp.client-ip=103.2.142.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1709545361; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=Qfb6bThjmv/VgqZhejNoWiotxzCbE3kVarYQxzt4WaA=; b=nZ6fOuSx
	DlM08pdNyakEW8IRf7X1ThhEfXW50btyowoydxHYx6B1SCwMO3pDltvRaOltEZUOt0CFSbGwxkPZ9
	3XJdfcKWzFOw9tvMnODcUvj8nCR6OnVQB+QbuLoakLxUMAudzaFpTWAKqwbfhfE/kzqveKzrsE/hK
	N1oK2kOOoOCjzlPEl5cvSGvOmaSHZAcprh4YicpYkZ6Wug3HEaMaV5Kn8Nbsm4UKeOF6lWgkdFHgn
	pZhJrkdugsV2ka7cwKHToy7hznQsaqefKV3vF5ugsO5uHsOpVdD7GjIFjrXO8mHKHfkvqIA/yzUl9
	oibzQJeP866SO/Jggc0jndsa6Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1709544460; h=from : subject :
 to : message-id : date;
 bh=Qfb6bThjmv/VgqZhejNoWiotxzCbE3kVarYQxzt4WaA=;
 b=my65UINstvEJOFJYf/i4Aag1FYZ32ZVx7iiGd+bNORNamON6ODmjRChjSIjQw/gJsnW5A
 Y3Fw8K9fF+HXmd6Q7v/DqhJ8uyZaFLxe/Fs5OSym8gSVSOZHuV4jeiC0Rd1Vp6OIT4177PK
 Z7SPB6TU4A0iqqfAfH6wOiMgvFOIvniH8i1naBp52Ls1EvWIPCeD+YPzXZrrG4hb7PNRPgH
 F0oNSYKYC9UUIuJ20VfIcAw8a8ZKI/4qL9TKPSOO5StVifUC/n0TCHpGehkeI2AK7BxT2Cn
 gHKsAv/wJYrRsAMdTjfsNURQ9sX+Hf952Z7GHuumyRAaBxF27uJ5BiMranvw==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rh4bK-qt4Bsz-RR; Mon, 04 Mar 2024 09:27:14 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rh4bJ-9EUhbQ-3C; Mon, 04 Mar 2024 09:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1709544430; bh=QmqJ7UhtuVE/HMfCaaiIwMG4Sf8WNDWahWxOP3KDP1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=44xz7tw8p+f3Vh25lAH4uNCGrh7BZZ93ShKdQYLxl4MDS/WNfvJVuoTE+BDI+MzRN
 Qf1nKbySvlIOOzVI3+r0Mg7pXlVWvDgMQz4MZBX9ScZcrs9i58NTy2dSw966tqcGip
 /MR+ab46lJht8yGpguI02pUatUgqG8UTR1f5RGeM=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id CEAA53C312; Mon,  4 Mar 2024 10:27:09 +0100 (CET)
Date: Mon, 4 Mar 2024 10:27:09 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] kconfig: remove named choice support
Message-ID: <ZeWT7XdgZb2_WJuv@fjasle.eu>
References: <20240303040035.3450914-1-masahiroy@kernel.org>
 <20240303040035.3450914-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240303040035.3450914-3-masahiroy@kernel.org>
X-Smtpcorp-Track: 1rh4PJ9ElhPQ3C.5le09HMBWtuZp
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286svisR9M6AQ
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Sun, Mar 03, 2024 at 01:00:35PM +0900 Masahiro Yamada wrote:
> Commit 5a1aa8a1aff6 ("kconfig: add named choice group") did not provide
> enough explanation. A use case was found in another project [1], but
> this has never been used in the kernel.
> 
> [1]: https://lore.kernel.org/all/201012150034.01356.yann.morin.1998@anciens.enib.fr/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/kconfig-language.rst |  6 +-----
>  scripts/kconfig/parser.y                  | 10 +++-------
>  2 files changed, 4 insertions(+), 12 deletions(-)
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

