Return-Path: <linux-kbuild+bounces-13431-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IM0A4hoGmrE4AgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13431-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 06:33:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0BD60B414
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 06:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2224305918E
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 04:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8963F31F9B3;
	Sat, 30 May 2026 04:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLP6IZ0p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617633148A7
	for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 04:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780115586; cv=pass; b=i41YjP+cloMLFuOCHG48FXu7DwoV7xi5vAvC2UQW4sJmCf57Izn9gNAwrHxfrK0p2RhPx4wF60GwziY3OoKsyfmLOxruwkaeaA1LgegrLz3diTW8WDMynQGee4OWhZLIj/mmz8wHny+FMgC5KA/9DUEEWFGR29j4GYu/R3KhsmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780115586; c=relaxed/simple;
	bh=QFu0xf0kxAiHthAx6Gq90k1pQbq/2hGxGXOlrv3QzLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LaHWAk6SlnKpMAFCtkvGn9swDoWR4UHiJ7UbCqOJjjlS2PJxzXvsvwwcqjoQ0pxkIXkxCVaFDTFXno85FRrXxnpImpJS3gCAZYcBEl17Wh7K1jYEAvPiKtDfH+KZHygiAttdcZ/WuO/cMcfskFK6OJmSx5RR0xt9KhlLgJViWJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLP6IZ0p; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-132dd3cb2bcso305431c88.0
        for <linux-kbuild@vger.kernel.org>; Fri, 29 May 2026 21:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780115584; cv=none;
        d=google.com; s=arc-20240605;
        b=lCALRWNXQfivHJDB7ArobLkPV47PVtbNB4KOGIFKbh+rvHK6uObdPoI5sPhldlPtxa
         aDGbQNm58eFKXkzsakeSu6Aic3wYCjgdUBdJn4pnnxpiLeAinaXZNRWzKn0vE5NpNimE
         VBsIJFdh1tEZ+a5Y661vLjejrfYHkDp3P5ttasugC6l+hCK1DozC1FPV8/WWg4YvqkAZ
         5LSq2w8me5TaB/ap3v+nIB5KdotMJaUijtu+5VNVSQbQPYyyIs6jd1ETX4aKnQYBsYPY
         pidsCgQVb51XSYiWoZbCS0hMkek+AKrQmJn0soJcEIG5wH4XimsBdVcg9wyX3lzhknFQ
         2TYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LdW8riYMTkyNsPB0scYxxqC5lofy8KfGVkA5QD4g4U0=;
        fh=UIqiQSD3svDdJ2V0jxET/eLzRHKt3VT74QlHijCxUqk=;
        b=PFSLU/TYFL+QHbBTpJck8iamPPJn0P1xhSWdNAcQdD8PCxtincRXQAi3djmGIf4w2/
         HWiICNarh+mc5JjdNDEKC8aIYxGXCHo8phJoVWq89u4F9qN3vXCxURjcUuirhjGlHZCK
         8bzM58pxwpI1T0lCwiw5GHM5dJTotVu2eUCMiobfa3hxo1zjMQx/49fb78TtwN1U5P3d
         ip+Q5t7kcSKzD7wdsCbB6U/WNNPH7y7CTZkyb1HPoda/l62G0nCm10nb1FrW3LgvK7RK
         M8EJlvzMlgvC80nKndSB3wWJwCQuILYA0NREVWL9rh413pec2y1I37P8qbMWlDL2PqC4
         PvEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780115584; x=1780720384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdW8riYMTkyNsPB0scYxxqC5lofy8KfGVkA5QD4g4U0=;
        b=rLP6IZ0pZNjooGTg2AkyUGG1d44D8XRqRydMVuT8TrGUbjqowyxr3PcvYUlU50ozfO
         4Jy3rDrWjURMhzIG+5I7vVK5jjswzXRvI6iqB/ZAXH2VT97ohDXdK8NrWJYZ1nwrIV5M
         c8l1XxHgRBTH+jo9Qp3BAC7mD8PpbJKZfumosbyeCZItx7hZBn0I6OvpcN/OqHwuk5fG
         a7vANsrSxf1u5U0pkzZg4U6usFazEb9iWq86Q8m5b0H+ddIiMwyE1YRN36CUlH24xfmm
         6g7ejjlSxHdY8eS5BIYctwyGFeQWzzfHwJz147Sy9a5QcmYxXKkrhfY+Sjq3/WNdR40s
         AEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780115584; x=1780720384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdW8riYMTkyNsPB0scYxxqC5lofy8KfGVkA5QD4g4U0=;
        b=N8zUMpeDq83udQ3eh3ZHr5DU8/8sV/1tc8yQ7BHQnJ3J12pmlgDUiCogi1brOCLiDd
         q+mxllOrsI9WulnvgogNxuWMaUK1hHhUU2zqEvluBbFcN79ifuLzak1ygOZbKHXfBMGx
         Jti/qJrBjo5We922M+5SKBmVHnZXXVzTCnzOPpqLBVcmp+5cI3i3EYFHmz8NUa1i5Ahd
         HrMm+OthnyfKd/XXHgvjsYKu5vWgGILKWB6sjN1oOtFY/BB3A4V3tlAhkLXluN7Z6m4A
         SAKtlcbgd49u6bac0acfl/L5xF6hCMh0WBcdmZzFCioBIQV2XjbiZiZJUYfvJxeYPdt5
         qZlw==
X-Forwarded-Encrypted: i=1; AFNElJ9lzcDtI0jObig5/mzgyCqOI0XOR66yD1rn6pBDwIPYsWWY1ecFDUovnDq196TGoq9p1T0KTPqZ5bzytt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWXcqU798/NHnSZu+me+/alt2Ct+GHnW2jpMPPZ5bA6udAzX1
	xuxsffj5miV9VgErfHjsiQCASEyAFxvfqUTmAK3C+4V3qAUZ1oOKPlSV9R4xRJbIukT+C415ooh
	RK9fLOwz3O2+3fxwDXgHhJbIoWZwCjYI=
X-Gm-Gg: Acq92OFmFVf3Hls+A9fROJrmWUXV7dapDK3M8febc7aQTBxb5QtLAkNpbGP1SFOOKb3
	+STIHzYGHY4qiXzKJpoEnh0ccP1K4pI/k3vydXkEKSEGg/bA56gnAjbwy/ML+rh+RONgusZwV4E
	TsbpzZEQxOV49lwo/e58sX1Hl9Ugc7Wafy68x/PnJ7iS/qWdgxg3dsWJVnYg7m730XKvvAsyRsO
	BA+O68KSxU/qrkegkFG0ZjuLqMhQFmDkfsPX6mmTyE/s0rj6kapATNfeAPgHxBH2QFF4D1rVYNl
	bRo5jZW42qfEHw2oVgnwoRL7RaxH0HMOjUwN3ye9FPBE+grDbUHdQFsV8C/t1luAt07ysLZv0aZ
	rG4FRwAH7F9+qnm9sWGg5GaMdvCJCtElvEw==
X-Received: by 2002:a05:7300:5729:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-304fa6b7621mr568722eec.8.1780115584319; Fri, 29 May 2026
 21:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529205529.75586-1-contact@jkam.dev>
In-Reply-To: <20260529205529.75586-1-contact@jkam.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 06:32:51 +0200
X-Gm-Features: AVHnY4IfLZfXYbhw88GifH2WhwO951OpP7mET1eUaiuSWxOV_KDmRIZ7h28aO5g
Message-ID: <CANiq72nO_qi7_Zmw03duP+QY7SssYS==FZ56zjkN57AtDAwbYg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: clean `*.long-type-*.txt` files
To: Joel Kamminga <contact@jkam.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13431-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,jkam.dev:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6A0BD60B414
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 10:55=E2=80=AFPM Joel Kamminga <contact@jkam.dev> w=
rote:
>
> This cleans up files generated by rustc compiler in the case of an
> error containing an excessively long type name that doesn't fit in
> a single line. Such types appear relatively frequently so the risk
> of generating these files certainly exists. These files are purely
> compiler artifacts and are not created intentionally by the build
> system. They should be added to the `clean` target to stop from
> cluttering up the source tree.

Normally, we try to use the imperative for the actual change in commit
messages, i.e. "as if you are giving orders to the codebase to change
its behaviour":

  https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges

I would also probably add "rust: " after "kbuild: " in the title to
scope it a bit more, since these files are `rustc`'s ones.

Otherwise, it looks good, thanks! :)

I can take this through Rust since I have Manos' there too, unless
others prefer otherwise.

Cheers,
Miguel

