Return-Path: <linux-kbuild+bounces-11072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VnA6KsVYh2lnXAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11072-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 16:22:45 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FFD1065A0
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 16:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 098423013D4F
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Feb 2026 15:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3516F3542DD;
	Sat,  7 Feb 2026 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvmOTq18"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295F353ED4
	for <linux-kbuild@vger.kernel.org>; Sat,  7 Feb 2026 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770477760; cv=pass; b=VZ/lGgXR0O8rKk+Q3KFQ+OwXEQxrnSsNSR9Ied9DE7TW4vgJYrFnA64tniEsDVy0Y9iSSuFYre1LEO+G9W9hPHL+7OLBPW4ic6XZrVAlryYzSsvLqV7yHMXKB3gwwkpgYR/dyNHp7culEuki745UKXs/9FM5IeAl7AXbY6t/0XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770477760; c=relaxed/simple;
	bh=WDZJqIG3WSFtF9/bJ5L1DSjSTILWykbHAEJcNCsu2+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiXYldOErmd6azB0cjgimdOVrk7lVGM96xmTN1TaiByLOyDBsRnNFjyHlyALzk7j1Z/mtQ7ymV05N1YSKdnHGpTeDvLyW7VsW2LHrTe+oHSKSWpx1ZfC4tS+t2ncp/NwaHcgcPX36tcLDtrhLyUwSo+rrfGeTij34jeBZmFCpRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvmOTq18; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1233ad1b4cdso222863c88.0
        for <linux-kbuild@vger.kernel.org>; Sat, 07 Feb 2026 07:22:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770477759; cv=none;
        d=google.com; s=arc-20240605;
        b=lOsVyaa+cxKeLzehgI09SMbhJzok8COYm2ZEb4BJOWTwNwSOl6BWpgss72cVUdI9TA
         75a7g3O/a0+b1pU+xz/kreb4p616UTXQK9PeIL6/sGLqk9eXgytr904Dv7vV+EZ7JZQD
         eUWlV5Bvm0sADFBhWMChF2Z9Lwi1TM+UKPBLkDDgsfS5975Knk2LWYYmQyJk4nUmBtfs
         FEz0bkmO/22MnPIli3X7eyS/qQ8+R0m84FWXTmjv28NBTzFP4wTzMTPRNw3lMZ2HirQm
         Sv9LrN7Ipnm7DEvr2jIg1RUS2LjZ5SOVtIJtXHt+gtXNtHxjSBeN+gGoTU6KfZM2ic9L
         cI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=clWv6MMAerLjp6KJnFnGBnvJGSBom/0zmYqwMTULdjU=;
        fh=JxiUHLRbjj3rEroAFptUExcKC0yfkfU+AruFQVao/zg=;
        b=DKijJSoVyuXefvUmpdQEyQXpED32wPvG/Q6Eq/JqjG0k0zdJY+EbYULA4997X/6EvC
         sX+2VNyZx6cRqTxpPDEAxOqrAAPmbyhDvJzRCyWh4AYhWI4i73mH2H//4A+GrJMP3BkM
         3CTl3RE4Pp6ncARK26+C9gT5HTPKiNlJ4yLv8p2bPL8mRRbq4U8R4n66lQr6dibQQwYR
         Yo5jFrSdvEsB0xx+bmGXlkCdzuuw0Ig6qxDffg4B29zCrSJlDpSf9Wl0de+qsyG9W7su
         pZu40lnmJy2z1ARwe+DH8+cwZv8qFRHrfp3BG8F6PPB/pmhajEX5XvnjtDf4xuLGK2VK
         aczw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770477759; x=1771082559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clWv6MMAerLjp6KJnFnGBnvJGSBom/0zmYqwMTULdjU=;
        b=cvmOTq18h95t0oaXfV6DtRcnpk58Rbh7ApjoLPDxjbQtql9hVMRE5TIpQKZ7a7IDAK
         GpBKr4Zr3myotadw3ci8rC1ZTUZuINn6uYXKLFqZ28LIedORMDzcfaa2+YiNSLhcUzkP
         yHMx1h5hMpIMqzzeC+5gX1AK98Jhh1OBpHP1C+1xGMWPlCAVBM3cE+IKbf6DPiLX4ZOB
         vEnDQWIPYR/KjnIvqKM8fVkHFhVGY180TWuaI0YDkjfOnqgyAypptFoJ1qW3HLUbAuy9
         pgpuMC5//lQV7XgMB6m9ZCUbuhEidlkE6ECY1JZNbYvCRnxebuRUYaT38VWvrSzOSVWO
         R32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770477759; x=1771082559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=clWv6MMAerLjp6KJnFnGBnvJGSBom/0zmYqwMTULdjU=;
        b=eLhH2/qOX7hrp+ATBhSI6WF2KOqmDAYk+RmtoHkk0DyOcC+tKHkzbT9hmtP3Cn9ftH
         lExtxZVYqiX5EZkhNLwccoRkmJ1WFJ9H1eb11wVMZkrdovYmV9WWEl3+e1u5A1Ier1z4
         pq1o8meWzfZaiGhEzrin+N1XG96Um1RvqbJUZE+HtnFlLzQrnv/iE85W2OskpMNfZ5W6
         nF6FW56AFXZ3MazjJ9OPheElU536D+EJ7V0rVeio/ekkPhRBCPV6K89rpNcHUSojZ8/v
         9w+SiHsJqNofyQ0MflXguO011doZZ3SFVx857b0euC3IvNj6i9Jk4qxPGp6wJHnQk5+d
         RsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Y4dv28KTulKKmoqrv4N9DVAgphuFFIbr6lgSJ0GHB6phR0Z9Tw6df+T9qEA0P6QbOHcYAPDvuen9y5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQjGHTvKGvr7VIFmVyyZK27lhTRh5xXeTWHiOM4CTM5epyJV4J
	ESYJ0LP0KQFcqgAhqSp0c+OZ34bavcAIKx8HKw2cyEXf7CsEQLdPTFy3sggjE/PCgHXhI218K3N
	MrChJ+09hUV9qMan+5jtfmc3dPU60qUQ=
X-Gm-Gg: AZuq6aLh/hmxoj3bXPjos/59VOOgJIT4U1u6t//N3P7w5k4mlm2oQndh1d2f08endZt
	P95jABsaTvjwFY4It6+uV03hfVvHmKQyekbsYn8PLU7Yh1W1/gZiBFJdZZZ8VpYgiMaB9jPTsR7
	Z+I/qSP3HVs+BXIGNuXOudXHAg9lKBQecjy+RRztsY1Ac10zu9W4dmq2gZwXVFVL4N/RHEO32Rw
	bJuwyah00t7ss5ySGKo60ZfC7SjHVIaXYgDbMjVAKJeFZRvTjRUBuDJX68vC4Eb7DML8GhiCtp6
	HE+1F94R6OyD4EQh+9PtEYxYTy4NM/jr/QOBW652m/bNeFMhnyMz+re3snI3nxOxr7l8BCNtITZ
	Q388BDOA6ofLraGd2OPVLlYFTgKzi+wmn4kc=
X-Received: by 2002:a05:7301:2b87:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b856c577d4mr1666254eec.7.1770477758946; Sat, 07 Feb 2026
 07:22:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207144356.3063613-1-gary@kernel.org>
In-Reply-To: <20260207144356.3063613-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Feb 2026 16:22:25 +0100
X-Gm-Features: AZwV_Qh-JsCh-9gqmkPwE8cNcW2MhjKv6BPVBI2JdNpRu_vDXQpIgbQ4c7F3rAI
Message-ID: <CANiq72mhhSKV=CecnZnqhKrt9tpGdMu1hePJtGDgRiD4JG902A@mail.gmail.com>
Subject: Re: [PATCH] rust: build: remap path to avoid absolute path
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, Asahi Lina <lina+kernel@asahilina.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11072-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,jannau.net,asahilina.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02FFD1065A0
X-Rspamd-Action: no action

On Sat, Feb 7, 2026 at 3:44=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> So, fix this by remap all absolute paths to srctree to relative path
> instead.

In case it matters to Kbuild, we had a relatively recent revert
related to this flag:

  dbdffaf50ff9 ("kbuild, rust: use -fremap-path-prefix to make paths relati=
ve")
  8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix to make
paths relative"")

  https://lore.kernel.org/rust-for-linux/20250511-kbuild-revert-file-prefix=
-map-v1-0-9ba640c8411e@weissschuh.net/

From what I see in the thread (but I didn't get a confirmation back
then), the issue was some developers relying on invoking the debugger
in a different working directory than the `srctree`.

Thanks Gary!

Cheers,
Miguel

