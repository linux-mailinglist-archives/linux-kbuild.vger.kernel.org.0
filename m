Return-Path: <linux-kbuild+bounces-12643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mArwA1y50mlEaAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12643-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:34:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1B39F77A
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAD8A303309B
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 19:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F12D2FB0A3;
	Sun,  5 Apr 2026 19:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM4E3kMD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B32F39B9
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Apr 2026 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417532; cv=pass; b=jtqBID/U6hC0FzTQ6p93dR0NDfbvipPZjqWhcnTNBsyeNf8GMgHsUyGWmioiPW12QQE16t1QX3nkokrY2UC01oYXwfIoqQ10CdkxqCexVEsM8qXIPCnjXYrK90unfIzAwEsYoCiIDAwM8l4nn6DTAZ49oEJgh2YVCq0BabRl66o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417532; c=relaxed/simple;
	bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibJi6wG2biVLBi/aO1FzsJALsiF9EocS9+tEXzxLMx37TMt0VjYuXS9L38H7LwfZphv1Kj1JjGgGIvAV0c5/Pt/x26cHADHP89aXKqWvI9g+KpHGgu7vThooC6C21pJ6t9qce6Uo64AQkm/U5HROErxwGnozEzw/3L++ufAdInY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jM4E3kMD; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2cdf546f956so48648eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2026 12:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417530; cv=none;
        d=google.com; s=arc-20240605;
        b=Efy945tR/YVcYsaOKRh+Egs14xn1gBnMLpbpdggKfclVv+MCkySo8qxsxhpxVEdiKE
         I0kckgDGxSlWRtuyZek5bkWvgt1vK7TS7T6sQ6Ol0BGDyGVA2w6UTf5I7ihUxNLYKc5n
         ypsdyLr/XVAeOD3sJS3KnEuD+r9K0LgeljqlYU8NJUpHhIQKlRW9IxOlU7zSoPvaDSpt
         +H9YlaGpqXPappFzX3QscjgmQm/Yc5LT1Rq3QWQ670Dl4A9+sPcfgMK4RVsbFmKS/Rui
         qN4pc4v0xWRDnhZB28I5R1RbtCVNl+WGVaf5rqv5551IGNrOXK18ctsp+qiBWOYpLQqr
         KqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        fh=FNMxPBjfOdDuq+SqD5euHOzruViVgtR9He5vV3ZPqtI=;
        b=d2Jpz1/oBwr6E4cqlmg8d8q3rObBcsZVDAnoZDYEUpAWymZgv2IknYvIBFgTZ/lSHh
         xLtVmC1MnfevRX3EmN3LSyVB41yfZUdSKYyeXEsr27tJ7iOB49HUE9BZwG7YB1oFN8KX
         tMarGX0Z8SCAumVQ3V7aekwHitGxy1Ls/I+EuUX7vBSAGFBllKg9Tle2c3S32iyG07O1
         V+9OiICk9eAAridVAChZ2cJPIE7s/Iswqjo1sEaSOa8qfTdmqZZ95P1iR+LpH3wRzj45
         tjMNgQPbdaSCuVUXdM5TGKkj3qYmIoPMMjQQbxI3+xAAdTaz4n1HNa7iIL3l/aUVTIDX
         Jptw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417530; x=1776022330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=jM4E3kMDqms8VNJHv8kbVSfyTEZTTKjtGooGApmTiF9/nl06mKbaW4l5qIrYswnwpT
         Kh+4uqPBEQCls44ciwK6q97c6RKkdhRDyH18GzzB3vo2S/H+Keo9XO7noiMkDp0chNkY
         oVvPX4x6uk8b0yagBZvRgeuVx38qA85crjHfPf+OpMXap5ch23Cu2O9SIacAvShK4RSI
         v/5nvGmWcIZ9XLN9XSXX/rtp3Z/xvyPg/yADjrkoUeFg7nDBaSirxtRcasaRJz6mxvND
         Zu5NAABnzR6ScrYjUxhifSEHfR1D8AOj53N9+osYsUGSSV8LyJ8h58n2OY765I7uh+ho
         g+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417530; x=1776022330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=LOJfTDNeiTsal2RTf2f8q4o8Ik5ie3EBInDIV2FDxskTPj9Lgj3gmCWHs57oJDF4+S
         kCX3m4j1oXsDa11WbzBRCqNMcl9TXlZ+tqOdbpksLXC69biLEqhxb6hOfplRlkIM5JQT
         RwWoFvVftlSuThKBGS+m0roB389IHxHkY2cndVzpT9NYtn7mCctVsejc8SZ0y90LeXKi
         anGHzAawZzG54r2MU4fmQEfevFSyxnThEzIwG4b/Op4Jr4uEWX1E8khg65bGTJyOQ6Fh
         qaLLwRqjrPq4cw2M6wRvrtKHwyXwt/2e69IfT2+u6RT3828zOBKjppKR2+u9D7GZyQNn
         rbiA==
X-Forwarded-Encrypted: i=1; AJvYcCU1b3i/fOFciZHSO0KVsG9gulEpiVrAEqOmN38mF0O92D+yRwoY2SYnxYkpLSOyRBcB+i+tsvaj2y7Zw1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRqXq9kORy8tYI/6WP2kmOTA69h6O0l/fNJw6QEtRH1NMRP8Sx
	1kQVeAoCirji4TwNleOtpdqQTu2RxwCZmSWygzEb6/9koUnsGBw36qCF5XnfdQ60ESQMmNyKbTC
	kABh9GSPQVmTcKmPvuF7xGN7NvTGzi5I=
X-Gm-Gg: AeBDiesT6z/668bU5dCTuZmfxMgLEdTm+VBv38+6keYRuFCNfx1/+xpjIOqbCLBYtn8
	4GJSJTAh4lU6may1DPZ4ocsCuJ3sa/cUJi6UIWb8p86pZMsdlWf/YUGvfyBvdBZJygl8iFML7Q+
	/FjUJ9ajzBEA46a6NGklzhvHEJIMztuoL+9loP3UFE6WnI/PqhClp2AXKx8anr3irOpDBXs03Cq
	0qEVYH4B7KCEguChmTLsBcGRfNe7AAfYFQmIO1Ep5cSaL6vwB0FeahXPovnix/MXxKLYnCd5exj
	lEhzmleQAtaf6uEuRejcxSV4jXHvTevysYssK4NOHTxNeDiC33kGUAmFZ/WrWqhqvdjIydykLo5
	iOe1k8y4vqC0cOaF+BLdxMQU=
X-Received: by 2002:a05:7300:cd86:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2cbfc768bbdmr2210515eec.5.1775417529556; Sun, 05 Apr 2026
 12:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-21-ojeda@kernel.org>
 <177508434460.73816.4231801886718165891.b4-review@b4>
In-Reply-To: <177508434460.73816.4231801886718165891.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:57 +0200
X-Gm-Features: AQROBzDsQvgh2EDKUg3LiGNTUf-8TUQBnEeLR3UEGt8KzpEPnOxtdZC7xsmuU3c
Message-ID: <CANiq72m9bsXZnMJv2w9eszV5DGUG1Cq0NCEUqv60=4Op__Uong@mail.gmail.com>
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12643-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ACA1B39F77A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> How about ordering this, the previous patch, and the next patch ahead of
> the version bump to avoid the need to mention it here?

That is reasonable, yeah.

Cheers,
Miguel

