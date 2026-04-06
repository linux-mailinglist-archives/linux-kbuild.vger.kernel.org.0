Return-Path: <linux-kbuild+bounces-12692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC+pBlbF02mqlgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12692-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 16:38:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82A3A4317
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 16:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B9CB30087EA
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 14:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8213859C9;
	Mon,  6 Apr 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgwhN/LO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E728C38553A
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Apr 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486289; cv=pass; b=Ddmm80vXV+vOlFD7Cl5IpfGquBSw8Ed9I+8HhnxJb9IZAVZaqoHAYhpyVslB15PcQadQWGoATYUouQd0NWov6Glrqy0LckZezsb3LYwnoKmudQUoaOoHji6pOYdeMuzDMAemVvCnKMMIEH9P+shE31V03zmindq4MoRrDwdBAiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486289; c=relaxed/simple;
	bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hok8C0cBMrC5Y2sFN4BgVnzCZ8dkkzjuN4S17vW0Oclku6EbWyySre+y39/J3uVzdsFLvehGTTT++fie1fWkW0Q9PWQIwIoEI6jyu9KW6yT5uKn7GozM7r6ig48lvS0rwJ4uFYuLO7+Z7/fQGGqYYjmBeeXP2zZZXgpQe4l6jW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgwhN/LO; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d1180e769fso17723eec.3
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2026 07:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775486284; cv=none;
        d=google.com; s=arc-20240605;
        b=dYAwQLNecWA6POfbrUPV7GTN1yP7VqbHKWUfQrA6tzy5bM8xYfl+egWWtk5Xk4NDFP
         WSgFFygoqfn1IoLGFA3OVjrTmdX8Ap7M/MrM1CfDWG/PwfkN8xpGMLLUpTLXi8sIXk6o
         b9/ONp3qFRsfYM0p4MOmA6LloLvtIdEVPCaCt5oVW407hSsVjVHxgcl3F0YwGy75Xz76
         XkaTtLhNKxWGq8QJllAW1HzdOh0yYxJdPreb3OsywyS2J8o/dNQ47a6usaWfvGUrH/HX
         zd7UP3+AFgVw+vk9BobvruhEXTaE38psYgHYSi8SnL+bt5zKRkJH5Pzm+AdesFkHnFDj
         OwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        fh=IC6SBfHdFUb6UkI5vCTD2Rv+VWCVARa+YnSQl03t868=;
        b=Ihn6xXp/BnXyulP+TE1rKp6njXP0B6v3N0QyvERT1sEKsWybYvBg+HQPeol7/MiSCM
         xN7Pp7+1ICznQlXSc04kk3br89BB4RE7AvuaODe9rkLnY0Z3xMleEvuxzZkcjCYH3lrC
         UqChkOMyqVv/2WQZvbs7H1LluZdvpIpDTnZRx0pb0vVst4E+CMyB5gy7p+SmAYiaE+Kj
         lRepOUDS365hvFj52Wtvi6PJQLs2VZxVy4II/psJqlcu4T9H70Zp3aT0Ro61XgID5oKR
         3484dT3x22dQx8UNWqCddDP5WGLtqcnECSIfUEa0aiS50Wmdk6jQ0oYF9uLji5bky9gR
         1HdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775486284; x=1776091084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=jgwhN/LOCRUuz5UtuAxbMF3jgJnFp6nKylfYyZFBTJc1ux/cteBqbZhrHUpd0SVrJ6
         9hhlLqqaYpY1c0QaNN6MWPPAIwh5+uX2vnAa59YCd3Q2Ao03JARshIQClxScR2gU23q6
         1Yi78Tqo3Y4/iAxKQ+p+X62sVoaB+OFZJCt2n+9UhA+AY6ZbTDd1LWJ9E3QbIJgzyByS
         8zBdW1BmZbAb+cnapbsOd4q15lxIceJHUjgfEn/NiAWrxrT0gr1mHOyFTsaOq+RvDLti
         a6G+lGC7X5xWVSu975ZjophQliZNveh4HFzgRC1AO8zyzB4RALb+QOAALbUrIIiMWMGm
         AnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486284; x=1776091084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=ELabZDqJS7wjdTt7yxQc+Jx5q8Co8QdZpMa1X+611KgZCjrs1EP0X7ZyN3wtQF9Ibu
         096PoYK0BdM83Ihlxz/ahENVvquYE7v3hICrsJg/MoExSDASHLVYBlTMAx9Wi5aW62/E
         veCxejbYbhqIx3OxJyuoJBFJLg2iYS42YNa25XjUL8ueY/ylgKdRxvE3UWUmwusR0PMH
         3txgOadYknHRuG4KHtGYN94+A1F9dY1cWXD6vPTf/jIPIMmbQfqdmNP4beJxI9lvXzse
         TPxUC+cZvFPJdUOhDynNSeBtz/UCZKMpNvkDJ3Y+i6+oi/zCUFuCFzd5cMNOXQeNxdPx
         IsNA==
X-Forwarded-Encrypted: i=1; AJvYcCUYCZxuYlELycU5GsLW7kyrkmksEDKUjEOGY9/Wd3chAJRVPI5txZ01WvYPiNiTb2NSMIdwRyYv4k8XdgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyemOQBN/Qk4XTdARnGlQyLcvAi7qpIP9QUM7gUbgfDkShf61rs
	e2zReIRH4qq7onQg4FeA7XAq3+PQg5Kbr/cVWnYa0a60aMYkFRqpy8BUhkVkpjPe5fZxmJcosYu
	QDCNIFVU1aX8m41vylz1wqHZ6SyxUn/A=
X-Gm-Gg: AeBDieu2CfLwt4fa3MKiAlVbDNeEnjA5llJp+pvCWZT+9bnRnCRJxFVV+wDJSq+PPcW
	e6lsvhIkAyADuNVl+fwlP4/ImPaJHxv1BxwQsfeWddPAoSWKdJ1Md1Y2rxP58/FZ4V/9ecD/vub
	gLt7PW4NNpBKMY3z6ovpXQQd2BInJdzLFw2ceNN/si9cR/Isho//L7MNr/a67AzOWV5+N03g6A1
	tyuqoOHLlYi4GCu6yk4Mf8VBYaU+suL+b3nU98B2wxy/xVUriproZCRZl+ui2DwSZzv0oMPiHX8
	tgpCElT22JgycVrdm99BCksygOf8tTHbtlXzaBJFJqSx2XwM/EuIVBg7hXxpBdO6x7ORtM+h4ls
	CQAFLLN7Lu44/1kz2Yd4Ibkebf/dq34II3A==
X-Received: by 2002:a05:693c:2c06:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2cbfbc7d828mr3020598eec.3.1775486284289; Mon, 06 Apr 2026
 07:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
In-Reply-To: <177548573697.95472.13544191227699996309.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 16:37:52 +0200
X-Gm-Features: AQROBzAshONAZRL6Bf4qdEX94VdiVWUdtgExWPcnxvz_Z_wjuLZH7VazFmpsU7M
Message-ID: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12692-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EE82A3A4317
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Could you add a reference to the upstream bug report [0] here?

Of course, thanks for the tags!

Cheers,
Miguel

