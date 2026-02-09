Return-Path: <linux-kbuild+bounces-11089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NTVIgDbiWndCgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11089-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 14:02:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9810F5DD
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 14:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECC05303A8C8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 11:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C948371063;
	Mon,  9 Feb 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggkT0y2i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553AC36F43C
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Feb 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637473; cv=pass; b=fCzK0FfPvNCPmoujBZGtD0vNG4YchdEEesHU+lRLZh1v3Au2WTnUCU9d8HveC2I7QgH6bfqPswDLzkggeVcbk08xIcyPfhpR7AVsk91CrQ9eM6Fi/ojnoNPgVWI3peCL0XyNg6q7QeWG7sn8G5PjHkHb9YoPpVVHv4rnzTgY0mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637473; c=relaxed/simple;
	bh=jWBAlxFqxUcmgAMzCHbAefvq4Ks9vhDZ55bi6/80ghc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgTykCZH2IazasLH80gx3Tn6yxiEadj16YAvKOK/h+OOIb6/2MK0daIqol2t/8/PcZ42BdWtBK5enW20t4qwOSur5ISCUJS2Z8/v4IRFukMO/jQ1s1OGDWCMWB8M3vHUJf4lQSzUc1mVIh0zR1+/A2Bc4zd130fCNC8ZkN3GN+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggkT0y2i; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1270fde1739so97109c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Feb 2026 03:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770637472; cv=none;
        d=google.com; s=arc-20240605;
        b=BTNs7a5iiHeyFAspxGQJRwMMKSN7AYzXp1JGYsSMDTS04E/x2AuiFtH8Gadm1Md2uN
         h5R8X6kaPlFvIL4VMLKSXd1Tf89VBPN3L3AiOWOQNUObmQexGOSe2k0Ty6ReDCw6TMGb
         ZJnO8WDKJyZ7KKmkCHdbyQ6fe307RWPM0b/4dk4N2B3jan2PIYuGpMvymJdzjiN+D0tp
         kqeQMWPwB5JLNA0M3qmBFRdPBk87NJD9QYGc1qJDLKTG9PrR/lr8AV1QsUlTTnFzH/kK
         zUKteUeYiJrHJBOjwPI/dZP1n8HWigG8blb5KDUj2525UOhaRc/bh/FQcPmR7Xy8Bjjt
         8krA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z463P7NbcGqbKV1tdT+mMP9zQ1Yf803ptUYTvGcTtAo=;
        fh=61MphGeCxTaQMAJYv98IO52ZCe+YPuNMNCkRNSOr0F0=;
        b=FGH9GMK7LjFRxDriCMI6r1friWlsUFsd9RI1V5RrFWIeTiNdyNzrt0rJ2bHU6rK3To
         FP5HcnHqoJfQwxG/z8cCIRX+BEevor72oO7OEuhOuU+uyfVD4lu96wa/1n7vAUoC44QC
         dxenHnx96lEZoqQNqPCDMwWXRR3j3LPrdmeb5T0UgWlHv3YY1hhmieVKyXJTK2OUcGUR
         1ELlcEys9jrfZulNzmXGZs04bPJW/cS+rDOJpJRlT4EfKdCQVA7LQX2xuYsluVDwpxv7
         5z5VUcJlJx71bIJxEifRLmb3pY4gTN77rtLMLpgjvW5Dpqnt3USWXkbSo4bbgDbw2+A5
         wueA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637472; x=1771242272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z463P7NbcGqbKV1tdT+mMP9zQ1Yf803ptUYTvGcTtAo=;
        b=ggkT0y2iP+yRzBj16ba6g5TLobVqaElRZ6/L4nBCQa9qqS+Mm7ZF6EqjNp00AZojJq
         f5Twwdl87Ju5ttwJTw8eJamSxEQs3FdExk2O9FXJtCWAgmcLOVobeEG8akbRQ5b7zoaL
         zqxBroX5On7R7Sp1Bd24QWVOjWlPlpRIb+/YddjMgEldATMFYGEBnrIAc20mjH/H1kNK
         L1GJjEcpqbVx18Slo9BXh7tNRZWgoUMNTeMILQNqSpT8isbw1oX+37DRgO2NDXBgH+dr
         U5K7h6GlG9DYMJaqiLO9rlTqqYzU+u5GC04wXhAns0RBAfOLIPs9rOKY44V5dP7sgQWk
         3XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637472; x=1771242272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z463P7NbcGqbKV1tdT+mMP9zQ1Yf803ptUYTvGcTtAo=;
        b=aWBgSsGRb2u8tA/JceDPQkJCNYs8Es/WFx/R0alTJcpg/z8RVvLKe9Mw6acCzAoJBw
         y10KUEDlA/+6DWcXfGlK09eXGyT0jfoNn/vjsPUdruwUvrfXACACSHx2JsKuKwWAkZ6K
         MdTAbN15Tx52seUEbHOEs7yzYUt8RmIdnd8n5aCpZC6b65oWHFoQDLbqTquFhqAGT07Z
         9OCukijzWC5OIBE5sTANCCgcTKk4wsuD/CgQ7FDCvbJ8rnRuUz0O28mHxMVAQlktnlM8
         Lq9PNwVpx+b3hJOCN2aA8t1HmQPiQnPPAOSsF5KyBob+VPpkwwyG1aGEMrVJqzepcsgn
         8D2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKsf33ZIRFpcFFM/u1pdETSJvrznLAYBXDITBcfqxUunLd/LcPeXJTeLR71dX5WJDstPmhyguqRyeJNhE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0PeoN9T7FSFW3eXpfRUwXeAwAvqhJRfZEjzgRHiFIxyErFVNG
	7vX/79gdcHkatU9qXKc5/g9DNs6EocuU7eU7z/fGzr0HBD6Owpe+i2qQjiwzRdNa6wSnL9VlZNb
	KGfa/bgYNCce1SCV5hQjmbhXPJP1WsHI=
X-Gm-Gg: AZuq6aIGqD2zaLj+Nya4TnIKhD3y/oZGLRgVe7KXOYxCTiD4laHbWeC4uTZC610AtL/
	BqLu35HNSmRjAu4mq5q1/F52S83bSARgwoCD6BdnHSmbyFZW9UnlxmToZ82zy1EpAZqIb5Ypd3i
	vLqrZ71BchtLAXYZYcpZl2FbHApWFnGzKfkli912k4l3bP0BIHjhrglHPiE8Ph5MxzedKPhva40
	fqcAVtdlitQZkGlxCGc+HaGAk351xY/DcuVlbaklDPQ0oKUxy7MhB1uhc7JU/1NjUdEC00mMkUl
	Q7SbpTMFZX98pQ6xn3QyomdI4oJ1cFSnHiVz5FfqdKAEvPYPaqyalpOWr5Q4jFGJLEhhUZ+oHrt
	qcEzG3tJvMnRV
X-Received: by 2002:a05:7022:458e:b0:11b:ad6a:6e39 with SMTP id
 a92af1059eb24-12703fce96amr2786239c88.5.1770637472388; Mon, 09 Feb 2026
 03:44:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206171253.2704684-1-gary@kernel.org> <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org> <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
 <aYgmENPRTdD4wCVF@yury> <CANiq72k4D0ZPDzBCHY7xq=qOmERHk3e7P8CcKtVHjjjOQhJ+2w@mail.gmail.com>
 <aYj7J0yTJtYlxLt4@yury>
In-Reply-To: <aYj7J0yTJtYlxLt4@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 12:44:19 +0100
X-Gm-Features: AZwV_Qg7nUV6rtPfWlG_LGfIqT8Y7Mi6NVOXBREtudXwxjELntn5qaYrZ-_btT4
Message-ID: <CANiq72kkLe-to9hO9+Q6kk-xpfAUZTCEBug05USruPymE4GkeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11089-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D3C9810F5DD
X-Rspamd-Action: no action

On Sun, Feb 8, 2026 at 10:07=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Can you please keep more context? It would be easier to refer to an
> example if I have it on hand.

The existing docs for `build_assert!` have a couple examples that may help:

  https://rust.docs.kernel.org/kernel/macro.build_assert.html

(Those are the kind of examples I would like to have in the module
level docs, I think they help a lot to quickly see for what each one
is used for, even if one may not know the exact Rust terminology
etc.).

> I agree with ""Build-time check" here is a bit confusing", and the
> following indeed looks like a compiler implementation discussion. So
> I concluded that the difference between build_assert and const_assert
> is not visible from programmer's POV. Please correct me if I'm wrong.

Gary has also nicely explained in detail the three Rust ones -- what I
was suggesting is to take something like that and put it in a single
explanation in the module docs, with the examples we have (or others).

In any case, to reply to this bit above: `build_assert!` allows way
more expressions than `const_assert!` does -- the ones you call
"runtime conditions". So it is very visible to the programmer.

(Not sure if I would call them "runtime conditions" though, i.e. that
sounds like a normal condition that gets checked at runtime. Hopefully
the optimizer also deleted as much code as it could...)

By the way, in C, `compiletime_assert` (if the compiler supports the
attribute, which GCC and Clang do nowadays) fails in the actual
compiler rather than the linker, so I guess it is a fair name, even if
post-optimizations. But the fallback still fails later, so in general
it isn't always at compilation time (and the docs use wording like
"break build"). I guess we could eventually rename the Rust one
`compiletime_assert` to match, especially if we get support in the
Rust compiler for something like the attribute (there are already more
`build_assert` calls than `compiletime_assert` ones in the tree,
funnily... :)

> I suggested const_true() over the original underscored _statically_true()=
,
> and this is an obvious improvement. If you think that 'constexpr_true()'
> would add to explainability, please submit a patch. I have a weakly
> negative opinion on that.

Thanks for that context. Hmm... In that case, given the current name
was meant as an improvement over the underscored one, rather than
other reason (i.e. perhaps I was missing something), then yeah, I
think I may submit the patch. It is not important obviously, but it
never hurts to try to align these things to reduce confusion, and it
is just a few callers unlike other macros...

Cheers,
Miguel

