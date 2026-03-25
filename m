Return-Path: <linux-kbuild+bounces-12261-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGyOCqISxGkXwAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12261-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 17:51:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D3329664
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 17:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FF53308BD2C
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 16:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331D63FA5EB;
	Wed, 25 Mar 2026 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cY8GfIVJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AC13F6605
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456499; cv=pass; b=EOhX1gD8UjbzQSu2gfO3ODEcuMuQhbhYx4BF7qsMT6f8es0FcCiF+UHmML4Sl2Zf/UIfnxs8B2ITJOIWa5p+Ex5K1wKxkvz4OkvUNDFd8pJWnF9VpNhlLfdiM27CTJ+SQSGRJhDOVjGbe5rHSLHjDaXnzfl3U++BiW/6Ng3OgWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456499; c=relaxed/simple;
	bh=fVUka6QRSdoSqopcl8+DYc6KjhZm4o4ga5M+4zCTdZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h46n4oKVsM6IF9/OEGEZI1/bHZ91/6CCTpOkcj0os8dAs/GC7Iw95CFy8jjKLRn0hMRnH9SJocs8z++RRbkp1nkVL9yucb/h1qeLFeHI52N/c0jDvFRTp2OgEDcKSNqiiwgLAGQLgnznXRA7oDns2g6e55W79IvUFEFqIWe5sLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cY8GfIVJ; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so69a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 09:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774456489; cv=none;
        d=google.com; s=arc-20240605;
        b=fSTPhhUvU10PY+ycqjWm+VSW3KsbpJoYQmxhLnBSphxnTXIWJy9TLBkXadjSmXXG7f
         SPmNsbdJJUHtr/ZOKzAQKy/B4PBN7NYL7VtYwTl0tHBzNAC5FQtk7W0hUvvuRS+1uK7n
         /nanRhKzCS7cC/NOGH8PH4trk4ZiIsfwLD1k+lwGYe6H2bRHy/XlQlOw77nyPfIi504R
         cyB79AXav4Sx/Tlj9AjZhFSbkF3V8hr+OEh3s5GVzssZ4dHqeAxydsipVleNT5m/lJo6
         k1yqHi9hdXSadTYZKeQEuJQDdcI3KdN7BEs0JQfXR/hcxtuR5Vi9FiMzPCqjMtsA0OGm
         I8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0S+fHePIggsFy0AXEBOBbO8zgatdwlcvs6VyR87WtC4=;
        fh=1QBIGZsFRSlzRlX8EFNs0KVhWgnC4I3ns0y543YJEqg=;
        b=YAr8OOtytzijf6wWTrp/SFIPj5Ziu5DQOVDqBqz+tIuAxBmk1zsdFBWqarwjTQ5b5g
         plI4P0J2w2hCeXjVD7jesBjCJOm1CZsXHSo4KDp58bIUAvY8zDP9MsmkKfbD4BOtL3gV
         /jJTLNl3fVffYy738FORbrbMItO5qbReY9o3hVzAFqzlNlh/tJHwMtHDHRkY6+wAdq6m
         e5FFGm6YsudooW/f227OPmouXvO5oy3LRuSgfKZF2wjP85vO80lfhxwoCDsP/aH3pFhn
         NEUyN2IQpQ7eS81FLfkFcBVys3yGbZQ5X82SFP2dx98QIiaOLnqGSpFq18kTCwLaag8g
         rokQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774456489; x=1775061289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0S+fHePIggsFy0AXEBOBbO8zgatdwlcvs6VyR87WtC4=;
        b=cY8GfIVJij0PK3hRA0vHOs2x0sPyy86PFKsWC4AN4jhh7h6Zgf5e71kMv+gWSK53WQ
         LNKDJB6yxwWFM3up2acefXqcmjM2WZJMpMqvwJaYKHYUQCOBKd8qUysqp9Dq+b8YzB6d
         NIi2u8h0LeKOC1q0csFHJDqhHgjK0eeOVPmRRjpyTClyC16SUzfSL0dpYbGGyFjoMRvG
         qLxscHKi60c+aWKR6N6T0Db6MA9FYDq6duBdJcjbg1KT20pe8YwOr71vspe3SiFoBpr4
         kktpUlUKeRbIs6RoAy8paf4KvUc/qmsoyr2+aesyUvo3zX2fkjWNGxZNMNIJgPZ+HiHK
         t2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456489; x=1775061289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0S+fHePIggsFy0AXEBOBbO8zgatdwlcvs6VyR87WtC4=;
        b=Vt251FFiVPPUvNKpnSrIciMsbYjAZBVG4OUE/036fCpdY+SXndud9b3Bz6O6cH6U1H
         JxPK3S3fGGt5jEbIMj2l6dU9YQw4xoq07h+sxhCHQM2lRauOwYeUMkU86BQNDQ3TVPnB
         R7DfWTQA98YomD+YIbR1qddzmbcHGhej8qQ3ZhGJvNM3wR6YFi3NdZRKxeSx7GjK0rko
         lFo63qkey8bHYUhM/2H3r0Io8CnPSfxhCXuFzLdjMGl7AH/saQ+czXlKbnU/CDzCq2Kl
         BMLn7/u6k5HINwr4Z16XY0zzlUEne2qhxKns7T18UwoilabPjm8dcst4ESGGAfK/OAD5
         p7yA==
X-Forwarded-Encrypted: i=1; AJvYcCUxk0UQyG5zLO5cURsxbWINHDsPcgRyLEKWweAoQNO3C91fV1S/aiTLu1EWGAQFYplyFYuWz9aTH14o6OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPqfoVEJA1Y8JNBS9ioV+SMWWEImQUXErLGDPP94QalQHFQCZ5
	a+c94NTeBXoBOlBFGEu/0lkYMESyLl9p+ZelU5HM/+BGc/fICc7yYpuJdHLzDUrg2v4UrFz+S58
	IHPDF4zgd9d9109DkY/CYxZ8hT6TCBAHy3PRh7fu+
X-Gm-Gg: ATEYQzwfCSjbQ24OwrD5IJRC2AvlkhDzvK0BHmj9n2CaXQRxezfA+VmydP6xOF9PyOR
	j4bDZCBQHpdF5ol0zLVl6yow8HX+pbIqxGj47WIFGy5C4W6F8KGYU/fz0ltXGpJZqzUJ5c/hJ60
	ENelLqWr0yja7J4Oh4u7GB26UjirTXctkxtldQNqG9BFS1m6bjV3I7iDGqv9F5HpDtdBd7Jut67
	3nXEw6hx2B4tGOwgf2uYPiMGvwPz4Cpsx92poSR5/8Hr2VHznYxrBV2vBwQEjCg89DIv0vr3uX2
	bNe/weR5e4IuZmA67ysilg5vXTRN0tWndOxdom2yFcqC9g==
X-Received: by 2002:a05:6402:50a:b0:665:4aee:2091 with SMTP id
 4fb4d7f45d1cf-66a84d32635mr43994a12.1.1774456488881; Wed, 25 Mar 2026
 09:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316212930.120438-1-xur@google.com> <20260316212930.120438-2-xur@google.com>
 <177443134349.415036.1506063887331719503.b4-review@b4>
In-Reply-To: <177443134349.415036.1506063887331719503.b4-review@b4>
From: Rong Xu <xur@google.com>
Date: Wed, 25 Mar 2026 16:34:35 +0000
X-Gm-Features: AQROBzCnEj7wN73t2GyTPCqzrLObCBImSyOeRDMFqmWvg7CtGODbiGadGl2Tyx0
Message-ID: <CAF1bQ=RsQfV82Gdpm1oUNtN9Yxf64C4_oP3cu6CY7Zm4qXOoZw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12261-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C9D3329664
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sounds good to me.

Could you also include a note stating that the '-T' flag is no longer
problematic since the minimum requirement for LLVM has been updated to
version 15? As of LLVM 14 and onward, the '-T' flag functions
identically to the '--thin' flag.

Thanks a lot for the help!

-Rong


On Wed, Mar 25, 2026 at 12:22=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wr=
ote:
>
> On Mon, 16 Mar 2026 21:29:29 +0000, xur@google.com <xur@google.com> wrote=
:
>
> Hi Rong,
>
> > Move the build rule for vmlinux.a to a separate file in preparation
> > for supporting distributed builds with Clang ThinLTO.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Tested-by: Rong Xu <xur@google.com>
>
> As Masahiro's original patch is now being modified: I'd like to add
> something like
>
> [rong xu: change '--thin' back to 'T' in Makefile.vmlinux_a]
>
> here before your 'Signed-off-by'.  Are you ok with that?
>
> Kind regards,
> Nicolas
>
> --
> Nicolas
>

