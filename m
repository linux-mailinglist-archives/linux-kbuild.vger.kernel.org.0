Return-Path: <linux-kbuild+bounces-13760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DtbgD/5RMWr8ggUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13760-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 15:39:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C269000C
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 15:39:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RYOnCVaD;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13760-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13760-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37D6631B3415
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 13:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F7A305694;
	Tue, 16 Jun 2026 13:34:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FAC3009E1
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 13:34:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616884; cv=pass; b=FmZOVurABMOK1sVlSetG32wvAaGD+a9gLQcx+YrIagA5mQNKCfhVY4FEWgu7okKpd9D2jgUd7F+WBvv1LWbKrgP+LwJ98sK/Rqa/lq2bFlgTjubmKuCWVGj7NgYYcS6/3IEZ/fgivRONnQ5WWgaKOgpKi9WtjKqJnJLLUchOdes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616884; c=relaxed/simple;
	bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijzYrdcuX97sDFMGvCdTOZCMXTpvDEardi3QhKyx4p5+L8osniqeP9y7EWnCmm2vdDAAvidQCsXtcCM2N8ClsgydJqzY+o5o3pw/rpI2jqW9zCgrZxzKtuYpyytzDahEo0N1pYC39uHTwv7xpG8I5ukChp+JEc5VTrS1KHHNZYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYOnCVaD; arc=pass smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so551108eec.2
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 06:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781616882; cv=none;
        d=google.com; s=arc-20240605;
        b=gY2UsoiBLAoVRCCXgo+zcNVr+pbxlu/6uuS9L1hVNzzzifMeirt8j9BWh5k5J4zJIW
         4FeE1BAlPsS8ikaK9Z2n6DmvSq1XglnAnjxx5jaAnoZPKVk4MhkNz5/6Qh6J7Itu+U33
         Su/aUjo6hMfpisUggb65d8MTo6DdPvtktdOIe1bFR8S9W698KzgGhTPhd8iygO0KkDGn
         8j4gtHDN/jD2jUvNE1cJdX0soPtUefjkn6w5gzVbFCs4kAa6h8y3RTREgX6RV583FczB
         DsjmwgPNuKaaCO+GVJPZ0QnsTQYudp3FxLT1If/o7zHCNee4GxSd3T/WAGbZ4vWJ/g2l
         0RgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        fh=PCwBpCBGlOHv8Tr6TfhiAkpLKSJuCl6DzhaWc+AC3Us=;
        b=cXuyQaFVilr49qc8e+UrLP0ungcGab9z9sRW68PUyDTOfVGpVGukJbzyYSpj5fMd8H
         PtyEG09CkDql9stnHoUj39RHDXHxpKifNB43owJ+KPS3NlXhJpPMTkQX+iUYXqN9slTA
         beuaJZVJRbts5dpraxu0QOdFEdHoHjmlwv8MLfjHnCzr6KoyIDAqbDeCxkdqb5uQtaCA
         yQO6wpajgNHa2mykh40qcDGPxFaGXjwNgWHT5mopcHxWR7idAX+YqDAd100sxgX2f5o+
         JqqqGGGOsSnc33cqwtBpzZP7QJ6yM2g3hiOAWdauZrrETSjOYj5SLHlAAaAU3ViKrkAD
         /cYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781616882; x=1782221682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        b=RYOnCVaDnYljJeTgv2qNuQDAOvvDo1eSRyvrsKoxu9nuZHDWtPGRuhSq6fx1lXvjDO
         sOlmD3eUWNNu9kCUXYQiROIBLY1ePKB1c8t60P7j6sS7c6oCAG/UT1RvUaW+9mC90lwc
         0ujFv+QNEHNxlcgyHkUAx4cdGk/Qmhv3bxJKWsVcqdzh5xNtllwzXMRiJLEqgWvoF1M0
         C2vmuwbzZ/ySbspvPfMf1OXiAqDC2mGyYNcM3hNzE1C+qct1smKpKHbwVrQBFqRp9h3d
         2MnPPTxb8tmKuiy38bgg4FA65HVt3nMEf0g6wMZvfnsR9xhEJQvTp78oAuhGuI7vWH+V
         tzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616882; x=1782221682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        b=l7a6d6+Na3pwOOrUPa4yy4uwYhvJlW9h3lCS+Lw4dFkkdr6qO8ULETVZxlS5QGTW3D
         O/8QjbFfoN7iNRnhMcEgll9bZdYCXfuKnT4yXuzGFqhpU0DZgBb6Hnn5amk1pvjYR7It
         8I1ZIxKFC+wec6rcqNyoN/ivpJye/9eYwCTmc06EbKkDcZJvu66ZDbIzEmbKqakkk8AP
         o9NcWWXS3tkVmib9Vzw38adahnMRdmBHaHre4rLkbSWj82Fhrwb3QTm7XreLuBltTSoe
         HExIqiIX2JwGa6TvUUXWPkEP6WCH3Bi1VsDfrz1YYJ/nj+Pzhowe6uZQLvazznUjAa6W
         8KjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tLrL6q9VdCSQaop1WA8DT6UXM+BiO1WGfe0LfBH29O5yU5ofyqrY41dEBqJcrtV1ON5LFcw48lvq4Wfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/55+7WrJ1UkDs8Ix3/Qqu7RULjOkAhNkDJUhrIsIR9e+WdyB
	9T9oAHd8fXRECPlumrPdvZW8eV5gwQ0eVItxwShhyQPoNoM6EvfpmcIfYIDoc6l3M/vrOT5p3vv
	zbm45S6cH9yu2IVBhWGecoHk3ot6MPWY=
X-Gm-Gg: Acq92OFoUND4OAuvpxcuO4ArjW+vQjzrYEVRkvL+fAF0G9krO74lVnugEKDKi8U1wq1
	BbhQRyzdlnSj1eQJ+tIP6hIFn+4daTjEHTF8OqJhSOEiWsUr1kL5PUag+VC7434Y8rQeNlbgiQo
	9UyWeQ/TtMtT6wQBe3xO/aoJoNyNtDwEvUmbw8x52C5t6/euLPKR2fAse34DioY8s0+fq0qtevT
	IEbLiKD84ES39zyfEuU9i/u0wKt4ebEYvE7DilBl5cW7fb+uuUzfGFm8Gb3fIq21wH54bY2fzyX
	8AveBFZ+V2GNncmJYQOXn4XG7RnoKgvY2zyq434rSLT9mCy2WHnK82O/9hfHFsIAkUkM7FozOxi
	aFDUid5wbViBQR6pkMhlGcwg=
X-Received: by 2002:a05:7300:4306:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-3081ff5d099mr5382252eec.1.1781616882115; Tue, 16 Jun 2026
 06:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
In-Reply-To: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jun 2026 15:34:29 +0200
X-Gm-Features: AVVi8CdWOkZz4CAAFIgrXWReHUHZXx2ovGTrzpr4YooCnTaJIfPp_aHfeTivWuk
Message-ID: <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:d0u9.su@outlook.com,m:alex.gaynor@gmail.com,m:me@kloenk.dev,m:thesven73@gmail.com,m:kees@kernel.org,m:wedsonaf@google.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:llvm@lists.linux.dev,m:stable@kernel.org,m:nickdesaulniers@gmail.com,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13760-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,gmail.com,google.com,outlook.com,kloenk.dev,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 961C269000C

On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Cc: stable@kernel.org
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")

For 6.1.y, we use Rust 1.62.0, so we don't have `-Zllvm_module_flag`,
so we cannot go that far back. I guess we will need to accept the
issue there.

For 6.6.y, we use Rust 1.73.0, so we don't have it either.

For 6.12.y onward, we support Rust 1.78.0, so it is fine --
`-Zllvm_module_flag` got added in Rust 1.76.0.

In both 6.1.y and 6.6.y, we also don't have `rustc-min-version`,
because the version is pinned there. That part happens to work,
though, just due to how lax Make is... However, if the flag had been
available, then we should probably still do it cleanly with a custom
patch to avoid confusion.

So I will instead do:

Cc: stable@vger.kernel.org # 6.12.y and later (flag not available in
pinned Rust in older LTSs).

Cheers,
Miguel

