Return-Path: <linux-kbuild+bounces-13439-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIR3GQ3ZG2qnGgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13439-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2026 08:45:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3F0614BB8
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2026 08:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7B6D3007B99
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2026 06:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3464F345CA1;
	Sun, 31 May 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOmtiiR5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145AC344D8C
	for <linux-kbuild@vger.kernel.org>; Sun, 31 May 2026 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780209931; cv=pass; b=VBEe0o3cJXexAkySLyiZBvgt+dt7UKOjKWt+64/4BMJCEjLELtP+jMqz7K1/UeQII2aiX8P4RydfbLZIBCe8MnrdDAy+7CZV/sk88EFcT/hWlOazWN34P5jssM0bJ8OBa3cy7AmPGawTwHYaUwjs8asUjBKflFQgK28rynpKmiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780209931; c=relaxed/simple;
	bh=l0S8477QSvG3Dyip1hUSjiO6JEar45YczihYrhVWLWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhyob9ICeixiXuSwBDZsCFkV9uI3XOsMYLYVIqcae18OQBZ4AsqM+Oh4JOo294wHTxEZQipB7QoJAxZ+4xxCSdcxs4hMe9DMIHhIUkVDuijw2jQ9ERGN7MZiVJYd/Pok47NLw7sV5NaWeCOe2lfvNW+pYHcrYAekSJQDazTiKNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOmtiiR5; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d4e57d33so278768eec.3
        for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 23:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780209928; cv=none;
        d=google.com; s=arc-20240605;
        b=UJ6XkKKCNjY2xiHaS+e597lwrskUTQXsTjklMjtHJjwYMstmmIVGDPbE/xsfWokrFB
         ZEUiy/mtGFX0nQuYFTTNJGSSh0ivDXJ5h5t4Puu88MEXWfeyLzehIg9713ZGnp8AZ8G8
         DIoyISezt5lfx/DCXqLBqZS+ToQ3oDM5tnh5Bbf5G5BtShHX2mCws9ljl9YRfvijBCv2
         vRZTN0Fc8Rqjq2bvqn9DPxomUJjdNgQXm0yHFhC+Vcn5ZoSKsKdhDUtlMB609qi9AxR7
         0LIY7oL4Rj6JA0v7fPDGzUvfsZNoUFBkPDHWV8Ee4ZvTPKSHtuuJ7q4UPth3wS+Ioq6W
         f8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0S8477QSvG3Dyip1hUSjiO6JEar45YczihYrhVWLWs=;
        fh=YxoI6kWPYNGU+boNiC2R+ytUO9ucchtg9BVWfEzLBU0=;
        b=KETI60gdhIf5NiRORSeCl7yZOaXQ/c1nWEIHJCvSicqw0Rf5RqFyBAs58t1IapAfKv
         iIHMygj+5+x/Coh79mCAghxCVyNmVyXxXNUVHWwIpU79DvxKdbDIhOXlL4m6Yj9UMISC
         ykXmQF6W70aUaKbXYsVvvWN/vczHNH+S6h1H41Nvlsz5MWZq3yjh5NRzoq8SP+tVZ3ej
         gdhoIB2CFy+M+0DvDGkPB4/KI/cqmg/y2aEn3mUE7+Ez5K1sV7VFlylxniCOJoB8YXSG
         n2M5g87pg9F9zuWjsuLOtP69hKcJ6kJaXT5Z14WJWJmHbc/yxD6H9NleaMv9PtpjyzFz
         9odQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780209928; x=1780814728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0S8477QSvG3Dyip1hUSjiO6JEar45YczihYrhVWLWs=;
        b=pOmtiiR5Nuvz848QajAdLhYJ9KKaJ0ucJJ8fcdEOT+oxgPdxXlVD+fJYgrzM7+mhqa
         kw/pKirVh3qM8m1ZQQMJG/CHU7toZbTXcCX+7k6HCEABuzeH+JhSOOns6aBHbOmuyM1a
         hK1Eq3xI8zdbdafHAFB+6dqIxswtjCG1HQNI9QkK9sIPF3UCQSR4EP0fGbaZjsgA5oY9
         b8DbugwpANHKKjECvRMxbaTIiSa71ADgJp5NsWf4ZZTWsBe+zJ152vrPOZW7RIM/+6hV
         3nvyKA+1PJOxJO61oFVbhPIkFDQl6D8uaq5Y3AAddOpxDcxgq/LqUvsNxgiwA7LqjsRC
         abxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780209928; x=1780814728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0S8477QSvG3Dyip1hUSjiO6JEar45YczihYrhVWLWs=;
        b=dtKkljWCVGLIfvkGtpWf/meSc3zeOq+lEOClcNaak3xW8pPa7q5bs7ZPCy2s8iriKP
         4hTBxa8XjpY6c9O8+5nU2hogSYd526vLeuFzvqsrxDTg2n3kemek9ho/b7CJhzqs4y+s
         2M8B3+HWNzqBhXsF+ybGnXXD8fUtYOSeS0OjK3swiUmJCpafpeOzG1/QxOALXIKStjhO
         B9xqCTA2B1eXsGq6Z3qcpaGSg4EisR0gcNawcrv58SbpBPuiUSJJj0KrR92km9zQlUEf
         Sm3Duu1iteG4c6LKPk8jkf+awvkNzyrQEw7p2yCZ7wTc69MftXA9JDn9P3gQE4R16Wzm
         R1uA==
X-Forwarded-Encrypted: i=1; AFNElJ9yuoXTidtP6vYHYJ8pjQd3LKPRmHBG/7Qiaq0cx0sfsyc7Wiyvwon7D/q89/tTBJmSJFClMGIpHkrNh7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwncGESqWfUHHuQLkMA3GcvR3yFXUwJkvhnMamSJ2WNysvicoy3
	np9nV8G6nDMla8Lu1zIW1JbSwgdqusi6GgdjfSKobH8ibay/sP5iv7/CBCR2IMI5rhuS6356u70
	r0BjcSHPQ1UwZvCXTeVRG+TRlWTgFkqw=
X-Gm-Gg: Acq92OFFtokOZm5Qh/9zX/49XOU0QBA2VVjmjI6DCJDYTOJdgicsbyb/ASOtGh7joqs
	EjHJI6wvj4yXxMSChDdh5nJ92sVLJVSoetcFQ9bIAlHb++sHclgtxwrwYccnXiUxJbEk769p+MT
	JNxbZzZ1d51katW/jLY2/ocsYiZRYZq+ugMi2eYBTlfou9fbcawy1DS9Gaa3p6YFYIc/lXtS46Y
	yDmattgFDKTYIVEYXL8QrIaFwJCmzG07IX3YBgKIZvnH7WI2yaXTUi8ZFWnZFSmZqSsBkic0pbU
	B4QLoVUNQoWUs3UkLytZy3l5Mpf8qc9zoX7BwoNnVvLqdf/XfZJO9UUqNLErD/V0lR8Gl3xFUHD
	kbP738Fvc0n704470zTYlPvbocmCZfB7QYw==
X-Received: by 2002:a05:7301:6785:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-304fa68f723mr1482767eec.5.1780209927997; Sat, 30 May 2026
 23:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530184944.10459-1-contact@jkam.dev>
In-Reply-To: <20260530184944.10459-1-contact@jkam.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 31 May 2026 08:45:15 +0200
X-Gm-Features: AVHnY4L8pDtXPdbKNrUQfpBv_HjLynBdwLkgy_JeIYUFSH2IkQeNYPWqY7tCCRc
Message-ID: <CANiq72=huc=AfjBRYUsoJY1hSvB8W6CvnUh7g2G4rt98XYmxYw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13439-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0C3F0614BB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 8:51=E2=80=AFPM Joel Kamminga <contact@jkam.dev> wr=
ote:
>
> This cleans up files generated by rustc compiler in the case of an
> error containing an excessively long type name that doesn't fit in
> a single line. Such types appear relatively frequently so the risk
> of generating these files certainly exists. These files are purely
> compiler artifacts and are not created intentionally by the build
> system. They should be added to the `clean` target to stop from
> cluttering up the source tree.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1236
> Signed-off-by: Joel Kamminga <contact@jkam.dev>
> ---

In general, please add a changelog after the `---` line. Otherwise,
reviewers need to manually inspect the patch to see what has changed,
if anything.

For instance, I see you changed the title, but the commit message
seems identical. Was there a reason to not change it?

Thanks!

Cheers,
Miguel

