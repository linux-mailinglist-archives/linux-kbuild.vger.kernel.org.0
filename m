Return-Path: <linux-kbuild+bounces-11546-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wClsJ5ubp2ksigAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11546-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 03:40:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 056291F9F05
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 03:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D081C30D81BD
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2026 02:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D2A261B8A;
	Wed,  4 Mar 2026 02:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUWgdfoy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987BF19CD0A
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Mar 2026 02:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772592003; cv=pass; b=U+w9SidLWTMgeiUd2+gj8+k+tQkqQaHT9BtUvG1qNsnqmzU/mxLm7AhhGiGDRgS4XsXSs5xUmVDRQVcLNtIVDooNaS0iqwa6XowvxRSDaYVfJtO4Sm2UeUY8quybI3N3OOGlgtRbuyucrwG5Z718wSrhc2bpBM2Mgthfg42fi/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772592003; c=relaxed/simple;
	bh=6u3WfzRtHs9u8vnunqqP00fx39IKEL4thU4xEicYcYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgb0ze6pIgsAbhEBBfUsA+YjzbtqtRtxfDvPkx27SAO5Ntj8pbwBxOJy9c4adneURRqaeEtqmZ2242AXzdhEFY0p2WilLnGQkaUzLg012HcURHkMz1AsesKVAS4uLMM+iDTYclF0DSl0KrknlUN66vo1osXDLwOYdNZTU9BimLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUWgdfoy; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2be2425ad18so111902eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2026 18:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772592002; cv=none;
        d=google.com; s=arc-20240605;
        b=B59ZVEdn6O3zWhRsX/PChq9c6vX06Z29VGpMPXIQo9U+/CzDA75Xzzpd+GzSiMnuHS
         BiPpGRzZTynQyd44nRqxPQB1EHcJzqPCsuXV7MLDU3IH3jTNcfKwiLizcheUpHDGi1CL
         6p8JiMNXirxwL86PiIgAU9R3dmn5UJcfLXz1RBzjVic2Jb8zKQHDui7nrKS0HVgVAJrY
         9+ZvR/hY7Xmfe7uR6TLhjcDFNnDLlxACtb0w6zJzvmHnT1o5SXdnU5uH+iFLcrN0ZewV
         YTULw0rpvQrDDk1zBts5r4M421vymbEGt3cQfLLmWg3K2hiO/7qgDkpricWk6QSVIPNs
         45RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDeFX6ART7B3BVdcaJ5X/veRzq62PjBspjay32pUUCA=;
        fh=AITJ6qGingCRGb66mt4C7NPCc4XbTvd1UsPNX4KDGQQ=;
        b=cpn3FofDkQX2w8HZxkGNQrXbMC3fKDqjIGOKgQLtu37fdutbS7P6fs56mvhHCzbmyg
         //MhrCFw+z+0OIEx0fAVXI9QdjFp5b7W3bchxPUEWrEMpwmOjlFkcV5tvsaSyF1OqzSj
         Rspk0jvUO5BTDSnMfAC9QgxVFKaNMak1mTlyCCHiqAXa1/ooGLFgrKIrKhmWKwfhFhk6
         SuTBvalVpd9RSDABSS9Kv3jxKAaPqyEgeJ+GWCy2RPoB38aVhbS44gotMG2nW4O2Pus/
         e3bFtB1vQij3hkqUWEdlIpm/JmnFiKMmea2361F+dRiTjBEPC22WUiuXFIA7KCnX6Vrc
         2Q+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772592002; x=1773196802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDeFX6ART7B3BVdcaJ5X/veRzq62PjBspjay32pUUCA=;
        b=AUWgdfoyqSuPqASadgM/9UEg6gGSKsklpXRr9tdkgM/I55NOT3/lzwT36uo3WOxVjJ
         eZCOV7oZIF50ykNIw0FZYEcQG6Q/Q+S535qtJThS1J2VzhOfXKyz9EuvQM6KhscQkpko
         DIi5xPex/w6kKGBd6d8M9mtrHay22Y6aEzyjAK0QdPYbUgCTxYx8NlzVIJ2M1SudZS+f
         Q8X685LMTkXzgdTocD8Filgqd6v94sLaw+l8TAyNYwxbHCa0ocl9CPHQbPfu4BG1qh/C
         bXx4zwd/Ntjofpg0blXa2tZyVoZlwc8o/LhrXWuYCsyU/3iGq62IwfhKNC0vB2dgz4gY
         04lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772592002; x=1773196802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDeFX6ART7B3BVdcaJ5X/veRzq62PjBspjay32pUUCA=;
        b=WhAqBtPoYlEEdro5QgSmdv3eWnicI/4cjvxC5Zu3ODZ1SxPh8+kld90iihmUp76vYb
         M76KYxgthmsBtMiIUlff7OUyX0ZwdHTqulrGBwvG11uzGkgrKV4eUtCbYDLP9IZJWWGu
         cGvm0fmJZ6hTukiwpYHKt/yYCnzY4wdJuSoS8N2O3eOspCECQkOdDKhzXCd92BMKZPa9
         VTjxJ7MyaqgDumLGBTnKTD02CXHlMBV9TkpWqGYItSaokTF0cT3hAacLqo4GaYlfJqk8
         e02OhG0+d6AIK0o49dpApaKx7ekMa4gCV8Dno5w/XEGlBQaCe5OG6sLJXQiABEZA9iQA
         lrgA==
X-Forwarded-Encrypted: i=1; AJvYcCUPHGqG7pDdzUfREAy8y2JPyrteV4xx6fPrYcQIlyQCMCaso7B7ApnoRBRxZ4Eq1Knx6clsJ5qjekC5s1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8zxikL/3D+BmxwqqpT/6Ym2FQra6kitNQ2QkCVKuEgWqI7zx
	CikJLs/dcH2mndX82mgzNIn+HhHAjmeqc8uWXGeHE69ABcbFNKvsobMQkfbG6xwk6c7OiOI6uw3
	2XMpx+pz1Ot1ZBzKB0LwyEUbHe1UGFzs=
X-Gm-Gg: ATEYQzyFHgf7gf5SX88+DQNRcsnjKhdcKm5xv+6yFAYxCn2JZcf2kbBqy8FwVd3qxX2
	AREXdJQC0zlTNXpoeq7QbLrWZm1PGG1IAoJnBwGDNdYvbWwjYHmZ04DZIjmL5wlWp3S89oCBsaf
	Z61UWUWdGPXXbyYMp0Urq2TX4iOxIrcNOjU7gXaYzISuGexJ3mZFyIZFG23rhQpJHV+YNXrkpj4
	YR507VYyGchkkoNpFuBs7EB6/MCUqvmJBp3yvWI5WEjw1MctLNbabP2aRlku7N5w8Hk2SvaI4Xi
	lWtzubtUTy2XsPGCrtJkHrIPwBsVPG/ulXkckZV8p0hEh15IbXf2wQ593EX3xCe0Ea1SsHO2U53
	nK4ha1GuRJoN+qMW7CZG/9dpT
X-Received: by 2002:a05:7300:ec16:b0:2be:ca4:e136 with SMTP id
 5a478bee46e88-2be30fd10eemr113160eec.2.1772592001174; Tue, 03 Mar 2026
 18:40:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224072957.214979-1-gary@garyguo.net>
In-Reply-To: <20260224072957.214979-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 03:39:47 +0100
X-Gm-Features: AaiRm50AQ1h-nlqQf5CDvJnD6CwsW_qLR96K0uS2KkMG7XY6Fo8_bKuyWFv3nqs
Message-ID: <CANiq72n7untEAnjO7tEorU37eNBCrepn+q7vb+pOFYb0+Uw6oQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: emit dep-info into $(depfile) directly
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 056291F9F05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11546-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,vger.kernel.org,onurozkan.dev];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,onurozkan.dev:email,zulipchat.com:url,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 8:30=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> After commit 295d8398c67e ("kbuild: specify output names separately for
> each emission type from rustc"), the preferred pattern is to ask rustc to
> emit depedency information into $(depfile) directly, and after commit
> 2185242faddd ("kbuild: remove sed commands after rustc rules"), the
> post-processing to remove comments is no longer necessary as fixdep can
> handle comments directly. Thus, emit dep-ifno into $(depfile) directly an=
d
> remove the mv and sed invocation.
>
> This fixes the issue where a non-ignored .d file is emitted during
> compilation and removed shortly afterwards.
>
> Reported-by: Onur =C3=96zkan <work@onurozkan.dev>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/syn.20artifact.20being.20tracked.20by.20git/with/575467879
> Fixes: 7dbe46c0b11d ("rust: kbuild: add proc macro library support")
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks everyone!

    [ Like Gary mentioned in Zulip, this likely happened due to rebasing
      the builds part of the old `syn` work I had. - Miguel ]

    [ Reworded for a couple of typos. - Miguel ]

Also Cc: stable@vger.kernel.org

Cheers,
Miguel

