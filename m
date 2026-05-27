Return-Path: <linux-kbuild+bounces-13369-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN/mDGonF2qu6wcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13369-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 19:18:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C854E5E8424
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 19:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B250302F683
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 17:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC15F449EDD;
	Wed, 27 May 2026 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIp9istw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E41427A;
	Wed, 27 May 2026 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902311; cv=none; b=InTT7BdN5X+PDwniffkT8I+W8BTO978BIGhgPMLFn5WcMemk6oAZKbwJexn9zfmJ964XUj7CSrLNJ/JqC/c+7Q2f8iIBWo/QH4J6MIQol/GrdZ2A/fzTgCEeAkLVmtL6U7S7vtWlCqzR6B3+eUdJFKoykjOf5/riH/9mga8VPfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902311; c=relaxed/simple;
	bh=fEMibwf+y8t5knkzcbcbwoZgVm/ad7LJRmoe20cOiRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7dSoQDvwsDYfFnttf9MurcPLDNevdHUGqImzo3aHuPtN9NfB6Be/l3qXGL1aPW8Mbua+F9iY/Ez3S+1Rh1+hMc1sYdhH8ZvPQvwIQvaXUfmYH21YuQYyVLI4ChnqYIN+JdQbA1QBuXc+8A4M8+E8gvKPP/Q8h1DsoBExNhIfnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIp9istw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D221F000E9;
	Wed, 27 May 2026 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779902310;
	bh=OaYEVa01C1fbNgO8Mv5tGt8BTdhgdWVcSikLut0VmS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SIp9istw/5p+c+Le+xoL8j20HDFX4V4aqhBpKMprcc5cY+etxRqsaG1uegeHpuEQj
	 4ciC7G3QrzVZBqYT6tevwO2hOUYuJdFph3e3p7VcLfj0eCQJDf9uo35nBTDgngqAPh
	 ILQeZfo8/f5t/j2qc4G9hjlG00bMOmlxlDzH4p6qxqu95N7tBCIxEFCtrNj8Sg5pVc
	 T9gS3I9mW/0ZNxo+dhb69cTPs8IewviJ8x70fLVEZpjasNOBZNumu6EU4Nx/V2WL+N
	 u9LHp2gx/0FBa5vaNVwQbdHD80B3e4jcJkOnji2xCLWTeLzm8RUXrkJerxYvvxlCZq
	 FCHESrk9Sr8Qg==
Date: Wed, 27 May 2026 10:18:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/7] scripts: modpost: detect and report truncated
 buf_printf() output
Message-ID: <20260527171823.GA1893026@ax162>
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
 <20260527-nova-exports-v2-1-06de4c556d55@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-nova-exports-v2-1-06de4c556d55@nvidia.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13369-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Queue-Id: C854E5E8424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 08:52:17PM +0900, Alexandre Courbot wrote:
> buf_printf() uses a fixed-size stack buffer. vsnprintf() returns the
> number of bytes that *would* have been written to that buffer, which can
> be larger than the size of said buffer if the formatted string is too
> long.
> 
> The problem is that whenever this happens buf_printf() currently passes
> this length, unchecked, to buf_write(), which silently reads past the
> stack buffer and copies invalid data into the output buffer.
> 
> Fix this by detecting vsnprintf() failures and truncations before
> appending to the output buffer, and report a fatal error instead of
> producing corrupt symbol names.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/mod/modpost.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index abbcd3fc1394..0d2f1f09019b 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1689,8 +1689,17 @@ void __attribute__((format(printf, 2, 3))) buf_printf(struct buffer *buf,
>  
>  	va_start(ap, fmt);
>  	len = vsnprintf(tmp, SZ, fmt, ap);
> -	buf_write(buf, tmp, len);
>  	va_end(ap);
> +
> +	if (len < 0) {
> +		perror("vsnprintf failed");
> +		exit(1);
> +	}
> +	if (len >= SZ)
> +		fatal("buf_printf output truncated for string %s: %d bytes needed, %d available\n",
> +		      tmp, len + 1, SZ);
> +
> +	buf_write(buf, tmp, len);
>  }
>  
>  void buf_write(struct buffer *buf, const char *s, int len)
> 
> -- 
> 2.54.0
> 

-- 
Cheers,
Nathan

