Return-Path: <linux-kbuild+bounces-13539-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9xxmLvAUIGpUvgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13539-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 13:50:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 390A263737B
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 13:50:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KRnathrw;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13539-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13539-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45489301DC08
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 11:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F763D0C04;
	Wed,  3 Jun 2026 11:50:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48061379ED6
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 11:50:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487406; cv=pass; b=pJ7xEbp30k1ZZz12kolxCCh5Vxh8AQNzwjtGpu2FwkIpF8Lq9RYD+iCduIzS9S13H0BojUGxRowyeUKADSKD7LzInsTe3P2YL35Z8+VUbGyeqBgNAkQNgZIH5WW3e8t/Fps6WOJENt+y3at2S60j9U3Wj5z3lx0nct6HEFENuNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487406; c=relaxed/simple;
	bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbsrcvcCWOckWXUTxWdRIKlB11te5g82u9JAuru6VXSmnWCvkhEcdamOiUDgdLblE2eB7eL8VoQRfLUHJOeflqWijTd2Fhzn6Wr3lTWYPRkM1Y1tPjDWUmG38EUDYOBnWu+qbCCrSn5e46268ixn1g4D3jUGEMaNvxoQaS/mK/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRnathrw; arc=pass smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304dc707bfbso549356eec.2
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 04:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780487404; cv=none;
        d=google.com; s=arc-20240605;
        b=G33sGED0QQ8pFYxa3SDwvAZm6xvjN9Ybts6XKw6V38YXM+/dJRi6X+KO1rtfC0X87m
         ntKBnehe4ih/TmnptBDQzgsB0v1+PESLeX+JvfRhiU2szsHdYTP9CiZrnfzZK2ouHtpb
         8ZBew+ptfnPXKX1Q6q8ywWoUEAIDr87ur14rPMhMrmSUF8TGglfuQkaFyvrzEEpi6kQ1
         GIUs+L/3EauT9aAKKfdn63keEIKUAkKC0ptXf8mXr70V5a2tNvbvFn1AC9HsEEcYNXuU
         VMcgu4sXM6PsDjBHFFkFiX7IivGDUu1Nx+Wx/i4SfWeSgDRe8ab8iExh5fRsG++fdg7W
         QSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        fh=khdPoRNgEu1Bv8sV88k+YbvqF5d5TwqTRV1daUSyuAg=;
        b=AbsMwLgnvzbyw/eKeudY1UrK7n8783OEZ9tVVi7hOCOqR8dFzZPrzhNPU7/dTHvzyl
         emm56Lx9i/rwMD4lsesPTqGx8HUdIaqERG0X4EJRs+JP2yMJs1S21FF9/2B5OsVArSsp
         4jMeOMg4I3TL8Vm5jKgPNxg8JGQChEGI+HVPmDOlQOEiEnZ7jDJWdYbaynoRjUD/2aTe
         oLRscMwKW7S+5Q7mBT0Ec19yp7xYPF9RngcmMBvjni+cdIsQ83oPN5/jj5jVrvlrPMVt
         fvz0Lv7G2Asxvp3tFR5ULXg5F4fmnozB7LQwcbk9ZNLU5ybBkS9iSncvJb+j0RqulcrW
         jSGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487404; x=1781092204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        b=KRnathrwsazGIKsqpPmMQMyIyuHRj278rBcrIS5sAzt8psTtc3QgxjVv5YBXgsXtO0
         8mAbIXFbHQ+ABtf/Nzwoe2ZsWhGnmp0nocFaJ6pse5wHf4hStlBpDXquRsE9jhiKHXx5
         Si03rTT4JpX/JkHOdQ4VMXAx240RrWkL380BnoDHQfHk5zEMKiAR4qPZ6khQVGxUMU4I
         fmu5X62DMZISY/A0uwS/GHCKlZjkquKp+GZWzHcIFCEoxXAv1ZjDzFyzqI95tIuCfdKS
         IqhQNtReiwUs4sC9G5tKcRphzXssrld2Yc0jdnz0e3MLtHQBPiOfU2qAAfhzlw8ZeuHO
         uhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487404; x=1781092204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        b=fkY8vIywdfsqyApE0z1eCEu4cAznR6YLNE1Vqqz7xp7jGPbAvzQrfzqBEIkeWs7j7d
         /KHS9WuP+Qiv6QGRvlzAZ4YJECRtkidtEjUwbGtthW+ZyF1gnGjSEa714iEmFVoRk0zi
         D2y039elSEdBuOgIIR5PghFdpRAtj7DbQWiPkLLFkk3MMPUff91OxsOwP9bCAj8dqbXm
         egZPSgB20HGHfJsyu5Kjmuscycq8dj6w6zelNOLP3c4CrNakQFtZ0uhlIot3tyqZJDcV
         LT+PbngWqOIIBlAYHCGgSDkFI4oAzVMdWnFYrRa8t9VYi9Qq/cbfrbHlJTWSSGZq0p1r
         Erlw==
X-Forwarded-Encrypted: i=1; AFNElJ9hoqLdL14ZCZiZKoTJGF8CLys08qaIMv52PR7mj6NgaaggOVNccQ8hCRUhrgUi6x/MjdzjmADTxShJgNI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9SlyJbuNw/hq+WOnicLBhZDmFOK68zuB5+lKcWZtIfkUmFJ/n
	SMRJ9fXXHOwUelnEUGLcdWiGYgxetKvE9YsfTrT4GriWRF57WfPc2A/bEJwCI9WITXj7Ul1VmqW
	2YoMb/lpldZzPUGcY8ncyM5+DjPGuLNE=
X-Gm-Gg: Acq92OGSj1tWNrZ1wV9iPT9lMh11r+DTzFRbqaXCtzS3WArSXg//oGJ68JhkIKubrYB
	Doa7y+rQ3ATVM2GWDtm1Kk9scHcX6SA5CBvvsc5tTxcOZwzWgbr59vQK9R+IUWlX1eZRWMFw+lV
	UYJz/XYuep123rMO/V9s7vePBiLEN6AjPlw/uhIs0Hyyp2yl1Ac+opxjTbpd8GR3jol4PCNMLup
	Icji9v7WRmWJY/+mA5T/RfYoGnO6spb0CJAHQ43hAcXsq1tT6RbmNLbgudpaBRUNqXoXVqDztcJ
	Qae82fgnlpQmfky1Z+FizKYfsxre1K+XLPdPFnvE9U51ZMb+LrBolFsWuKg1QKFXLbXUQl8RgjT
	wA/Srpbx9iEjan8QR54bq6Mztz6pD918I+w==
X-Received: by 2002:a05:7300:cc0b:b0:2f0:ddce:8468 with SMTP id
 5a478bee46e88-3074fc26eb6mr769327eec.8.1780487404307; Wed, 03 Jun 2026
 04:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
 <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com> <DIZCF27FZH6I.17CWGBTLDNSMP@nvidia.com>
In-Reply-To: <DIZCF27FZH6I.17CWGBTLDNSMP@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Jun 2026 13:49:50 +0200
X-Gm-Features: AVHnY4KLkt_lJ3NQBEx4139A-z2PzHbNSKGJ40zqfE6a-mpUvOd_VHKVite3y1s
Message-ID: <CANiq72nTEPWds0VUKC02RLh5a3TLNyShikJD1h5TDc-26rrk_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13539-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:joelagnelf@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 390A263737B

On Wed, Jun 3, 2026 at 12:30=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Yup, I just want to have something that allows us to call from
> `nova-drm` to `nova-core` as it becomes increasingly pressing for us to
> be able to do so, but will be very happy to replace this with the global
> support as soon as it is available.
>
> This patchset won't make it for the 7.2 merge window, so if support in
> the R4L build system comes during the next cycle we may even be able to
> skip this altogether.

Sounds good.

> I haven't thought about that, no - in that case the parent `Makefile`
> would need to be the one in `drivers`? Or am I missing something?

I think `drivers/gpu/` should also work. Maybe it works inside a
deeper one, but I don't recall trying that.

So essentially you can move both `nova-drm` and `nova-core` (and the
exports of course) there, and then since everything is in a single
`Makefile`, we can just add the dependency between them as a standard
Make one.

I think you don't even need their old `Makefile`s anymore, and that
avoids the double building and so on and so forth. You still need to
emit the metadata, but I think we can pass the flag, avoiding the
custom rule too.

Cheers,
Miguel

