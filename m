Return-Path: <linux-kbuild+bounces-10971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMkqEizMgGl3AgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10971-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 17:09:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F68CEB14
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 17:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 398D5307E9B5
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Feb 2026 16:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83F637D12C;
	Mon,  2 Feb 2026 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuzNLQb1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600FD37BE6F
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Feb 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770048075; cv=pass; b=I0vtj3Yle0hDzJIl48QoBCBVPDmyXTzcshd2Ev/KMOoyyRfNkzLXdsCQ7ZXqlMixV2tMS/jdsDKBI2TXyU6tU8/bwwyIdCXgeu+xlFp7CgTeNBMhdlNbfANn2UiRDHePATHwdm6zMXtoOkBWRzuiCP4R5893IhGNos6L/9ZKkU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770048075; c=relaxed/simple;
	bh=0BtDeyyl/iEgg9hwcpMaGrHfwUoMjGiFjJ7w+1aGu2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwT47lQndBJ1NhhVAYwRuEHzt3Aphu1VwDKKHJb5EYPvzElMIUnby7CddxVF8JwtJKPxXLTCTsjORZ3KrSQy0oOs5WzbgDUB6EzQvvG8qzxa7c+sXPekqRDVztO8O8w9T4AUkJZmRlmQQA6g7Kuoy/CQQcaQCsTwqf3ndsvdQ8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuzNLQb1; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b7267ff06fso230386eec.2
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Feb 2026 08:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770048073; cv=none;
        d=google.com; s=arc-20240605;
        b=hd+SzdQVuNsrKVh/HeWK061c97PzpId59C9+KkQ7ijE3dCjJVmLLxWvPN4WuwzCyny
         /XMhm0xLmBMUUu4d3mA4Hta+rO7aj+s3nsm6PvA/M+juzVrSs21AtLfpC6vjb3x63kZX
         mAc3G6UkaxR0X/e+6L0tYFwwOvXwDVKtURuKbJU9qxRLdQvt1s67/21hhvb9dHo1Dv6d
         7ui/pX2eTrFdMNiygco2v5seLc9cU8Vq2S/DyjNOGX+gJJTB4pqF4YubArNoEaod6CxZ
         WN/L47JWJX5jsoY1qlQHZMEK64nztF+UQ4SdSGTCDlnQ/FKkyEYKDFSyRzS3SPrgNQ2w
         RtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2yFLlLhyvsK2yEKQP/gByFr2oK4zM6au86EX7CUR3k=;
        fh=kG1+cE0y3/BIlhzMMCbB+hXi+bTotGBvoZnskUJtC+0=;
        b=ZmjPDOc4Rg5ytzCFQze61Uj4P1H24GNiF5VV7HMAekzbjo8TOZdY060FKHF2jAlcft
         H1ONOJNwm24ifMU3xhVjCAAIhYrtUbgUwJwi5LnhxId+s9IWQrZcVEr6xiBvszbONL4x
         ti7f412bO0WRXK2/uY5Fsj/1DgcQV06Qem8pSq+V/y1qUapFFTRF25JBg4hjV1ONhUH/
         6iCQikU/CMQZtGVF9kTefqeXUpWH6WNWez78XP83w6L/PQC/eYMbGv8RUZvN4vMeX2U3
         O+vZ7jJ0wcbjMKNChdH6CL/3UWjzip2RwbkKfWyKAPGVSZcOHRSO95zF2bv33lKaEgfe
         SMCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770048073; x=1770652873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2yFLlLhyvsK2yEKQP/gByFr2oK4zM6au86EX7CUR3k=;
        b=TuzNLQb1/hfkk0AkVG78Xv/3KYfntdFrEHqIG8T1rUR/9Xax9ZEpl+kAdkbOesT1Ex
         BKgoDwTSylll8f0Zi+pOXXztQwDt5a6TrJqkusgmVVGlf52MN4fcFTUmcLLelWB14W69
         VzR5OZVk+q0YAu1nAuhFcDqhFoSPHVZJykl4gbf3fOj+y19H19FUgVqv4l0MWNlFcLLo
         JlLE1gD1XttjHF0MXWynnlOiw+mj4txbhK8kVFFauNiQh3aHlwpwqydxu1ZXv0uwrbM1
         JmnKkEsbO8CiHLOAAQ3K5r/uXf2GVyyCDCsnmolaIwOgMadChn0b076GAGXF1OfylysB
         BQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770048073; x=1770652873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2yFLlLhyvsK2yEKQP/gByFr2oK4zM6au86EX7CUR3k=;
        b=r1vFCODQVS7DfcRnwAYDSwj/yIpxZUv7NGdp4PRVBJ7RUX5LnCbsRvautARoe5GgIa
         7MkQ6Pb3HbIQWoMUng/TidzMzpc85mxkZrxdGd6v2RXx5GoFifE3wNQite6OYL4QTBLX
         vRsqg++5V52eRBzBQ+mtEJD6jUhxT/yMuEb/F8PXT4A3hxkn3eRG7a5TJqHz3/1XyYhd
         HYswGC8Yg4p4dYQSMpSHbkksURcBELUYGkLolwqRvWqn41un4HeTQJjo0Vh9SWxshHar
         /u9myLwujrsJlVbCOrA4f8QUbsPNXKKEV7ktPkNIVQA/mJGm8Wq9OGvh+BAsjVlGL2pN
         6cJg==
X-Forwarded-Encrypted: i=1; AJvYcCXmE9D2sdkOWb0ah4yegw37L+QqGg54IfdqicVL/C8p/4HYq0lwcKnB/lVPfiJ7LuuHjcP3TFT43INRjW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGabbQ9VgIKqe3+gs01+U5PB6ZPK0vBTbpLQOtjwquKsHF+h3b
	kCiRO0gZqcwQ39bisuzgn5YDfcdW0MrgqUMEgaK04fk/vFPO87f1HErM6Bt2nQfI7LscyLFG8Mj
	GP/8miActQAxqPmgcdHxdRhuJ2XJUCWk=
X-Gm-Gg: AZuq6aKuzrTZOBZu4z+B0Fn6DCtCixbn5VOXhv5fZ0hRj/0pHpfvYOz5TCKn/eWIz1L
	bds/BVOmpTO7wmilRSUIYWMkgE1LGs4Eouu2cTYVesM092XTmeWwXyIVbO7dWCIFeWaZcMS5jfH
	nJYJAIh9A/GsgAtfCReTmYqqMaUvQvKHucxa0qkRrLWQyEa0gQRc+AzPdykQz2HLNs4+Bgn4sUN
	jyf1lelHn1fNJqiqT8yPy+3mmEbnh21b4D6anlOz5LUlcJ4+UMcpvj+7nYPjcihxQOS8+cEQq26
	yX3AkJrVVBVmYQJoSDenTB05UWtYtxFdTbiNtryk5HnAHtd43gR6B4iOB3QCy3qDPDmpkmc1Key
	kE+8jHm+9Zv+Q
X-Received: by 2002:a05:693c:2287:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b7c86dba33mr2866701eec.4.1770048071379; Mon, 02 Feb 2026
 08:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202222144.2689495-1-mlksvender@gmail.com> <20260203002116.2703251-1-mlksvender@gmail.com>
In-Reply-To: <20260203002116.2703251-1-mlksvender@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Feb 2026 17:00:59 +0100
X-Gm-Features: AZwV_QhlLkKU5asgPXcnSf5m_gL2EtKJ7XV2olDXWzfVVBZdXU40rEAYbiSjYi8
Message-ID: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Makefile: bound rustdoc workaround to affected versions
To: HeeSu Kim <mlksvender@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: ojeda@kernel.org, gary@garyguo.net, charmitro@posteo.net, 
	a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@google.com, dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10971-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,posteo.net,google.com,protonmail.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7F68CEB14
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 4:21=E2=80=AFPM HeeSu Kim <mlksvender@gmail.com> wro=
te:
>
> This bug was fixed in Rust 1.90.0 (rust-lang/rust#144523). Restrict

Normally these references should be full links (i.e. a tag), since we
do not have "autolinking" like GitHub e.g.

  Link: https://........ [1]

Then you can use [1] above instead of the parenthesis.

> are affected by the bug, avoiding unnecessary flags on newer compiler

To clarify a bit: avoiding the flags is good, but I think avoiding the
skipping of the checks that the flag does is what is more important
(i.e. if it were just the former advantage, I would say it is not
worth the complexity of the added tests).

> Suggested-by: Gary Guo <gary@garyguo.net>

This is very minor and it is fine without a change, but for
completeness: for Suggested-by we generally add a Link: after that
tag, i.e. to lore.kernel.org to the message where Gary suggested it in
this case.

> Fixes: abbf9a449441 ("rust: workaround `rustdoc` target modifiers bug")

I think this is not really a fix anymore, i.e. nothing is broken, and
instead it is more of a feature, as far as I understand: avoiding to
skip the silencing of the checks.

If you added the tag to suggest that the patch should be backported to
stable kernels, then in these cases an explicit Cc: stable@ may be
added, mentioning the versions where this should go, e.g. in this
case:

  Cc: stable@vger.kernel.org # Useful in 6.18.y and later.

(I used "Useful" instead of my usual "Needed" since it is not critical
to backport -- but please correct me if I am wrong).

By the way, I wonder if we would want at least a `rustc-max-version`
function or instead a range-based one for this sort of test. It is not
a blocker for this patch, but we may want to limit other workarounds
too (e.g. the one below this one).

Cc'ing Kbuild since I don't recall we have that for C compilers, so
there may be a reason for that.

Thanks for the patch!

Cheers,
Miguel

