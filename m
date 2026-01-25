Return-Path: <linux-kbuild+bounces-10859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPGXJts0dmkQNgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10859-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 16:20:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8281288
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 16:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CBD130045A7
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 15:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533EE27B353;
	Sun, 25 Jan 2026 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2iJqv0m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD4E20B7ED
	for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354455; cv=pass; b=bhDiQPQtsBbB01sII9Kz38P10l3VMEZ8Gb9dm9yt4/nywymNxC4r6eOCWdx9tbq7Emh6XX/hOfS4irJICmX/+vofbYEC+iU8QtTZHZCshoe+9av+d5jJfP300Sx9OTIxb5O/Eu0HPqsmlXUyqj9JSOq7ZS3YxrtIK81AGlHYWtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354455; c=relaxed/simple;
	bh=FKcu4hAyc+DEzz/XiiFQYDRypKJiPPiyPgXS1+VjCkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lr0dBl8IO0DhvujSiXTvg8iCpJa6nTyyJ3BWAmNENsPcgQcHSvAcebo1MJY5bydohb8vFnRwwEJ/cfMWh+aR9wc4EhvMIY0kl07aE+TF980VhYu6qYUeoEaDM5+e0LWDgWy/YuWtIuEhz9dZ09kgNrz6tdgeMPpYxRMj3wOKvuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2iJqv0m; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b701d29ddcso126523eec.3
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 07:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769354453; cv=none;
        d=google.com; s=arc-20240605;
        b=Z9q8Bryk63RX62FtGCwzzxjPuZVhvOocAgU0GDROEslBT4fU6weFbwR8ccfImI/zQU
         qjEEyJjUE0YYhDDj+Y5I1mgGR0eRcxNpBQ3e3hn8Mw4v11c96YbQUilzKlomT8Er5sgv
         fce557crNUQ1qQPEvIGtN+mnAxZD2YFFUQAKIfKIzxvfuoOrJH3TACezq6JD9Lgp7AKF
         PqlZhzrA6890KHLQwK+NftFWRGGd93oijWbcRXoeHrjOrHPCFch/9niyeQsqfZ0B6+wW
         e2HTGUvZBN5N+6jx119I3Ro00YCQL/j9jdrYxNS/9PSW68mvvnUagObi4YCt1Z4+pHf2
         tvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4dZ3GGCHvxuQxQnxgs+hi+BSl/ZgianZ8w5uToR+0y0=;
        fh=2kwY7QJ7ADSAO6GF9g5GzxlxhMO8FeI3Xn/JC3uNfVk=;
        b=ZNx/U1FABrWCdhX/eHxTWv63C2QxPTb20ePjiBY85SXwg1BS7ZYUpuPpLsKUbKjAdi
         K9q1qfD92RT/dyn42/z+C9Gnmbn6O76OtMXlHNRbS6+GD9YNBH61smo77e1dhL4VZJ6W
         8JYvxkemcUaGH8H+h1YxLpxORrkA4TBPF9ipM9R2juBnaNlxlwXeANfNmBV5qJnxRbYi
         HMaOlNjcf+A3aoPOSZEycZ1ttund48aQM5qHtfNd4qzFTQN/l8qnOvkEUIh7pCUay2Kf
         3JkrbLxBUoBTrbq0CsY0u9UuuM5JtlGKoHQkN+23Y/0yBobKaVM8mizMJNbQTCTcML3q
         tiGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769354453; x=1769959253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dZ3GGCHvxuQxQnxgs+hi+BSl/ZgianZ8w5uToR+0y0=;
        b=E2iJqv0mcT3v8FnGlqTwwfw1XTY+Nfk/bMMuninV7uVmN88bEs1CPtAtR//Tw2YVyn
         a5XVpndi5ioOWH0ewXOjXKAgUPkxS9vcvQRKygSrpkLQxfh/JoKam6xN50ddqiBhgrU0
         fNsjijtsSZkM7to2+4qhB6w9xG35AiI98UV6TgxOxKgDi2SaJjBHOLq2QZ59uC3ztCVs
         vlyiC033kVeUJyXFzkPP27iEUTfBcwfbDCvNKTEmPZWwechtwaGJVixcJgW+feusk6ef
         XWvXFSyRTVO+LuUhcY0Lj75X12VMHj8FGNrdPBAt2K3EVSHm52Ya4Cd71rz2m77zkGRJ
         aH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354453; x=1769959253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4dZ3GGCHvxuQxQnxgs+hi+BSl/ZgianZ8w5uToR+0y0=;
        b=a7TLrMfdktk3d6AulQZjNV2EKCTqL2x++SzzYDHnxvhJs2SEqk0ijkmmF5GKFeDQzY
         dJsHzmKCuFaWxuPwf/g813au4t2ZBgSYQWlAEEC5vopnx8MlnBWAgDL5nk5QxDUCotcw
         KGtjhT9s7KCOTODf01jyyHl3Z5JrKubwWkvyiLVQa5c/EIT/dZX7yk7Sx8Muz3eF2ukC
         Jp3o8mZS3Wc8R/dYHq4Gm3LwU7Quw3dngedLzqBwYE4oAruodMWYDVFou0+5OFdry9pC
         4C1VZnYh+jqTgKhqcT9qla3MulI8CTqsz2oIQuxSrYpr8K/mQM/tnRR8fxQrQN1UWkoL
         P3OA==
X-Forwarded-Encrypted: i=1; AJvYcCWNsfEdsLZ+5qzzwrqZE9nVsdnvUljUsJfb0WYsAkjiy0+HNH0ZAGlk5JTSdXlBJ/Zolp4LrIvqrcOM62c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfApT6jXFEY7egZvOidHBoZcaa7MCVqxDI90raXJur+jxtCBOx
	hFXdACCrWNFd2Nc0sd4hCGxTEuQVd1E7jAC/Itf7CoIsS6b86KWshNeHKyJajsYOvsj28fW5usP
	vAncA0vrta3TIulSwljU8nSFla+odCeM=
X-Gm-Gg: AZuq6aJLXcmc43oIfW9DNH16r9Lh4am/MN/nWO9SeDSlqgE4GrblloXiOYRznEZhvbF
	QHcsO6pAUqVrvJvwe8qXvqeEBjLaIGVjPSPmxiW5j3tdeaHnCB08fSuHXWkJXV2HEXtLun4J6d5
	0vlhpNzCWiApvJby7ZTMkmCwI7DzVdisqTaAmlgPrGYQrAR2vUM6FXueoCeK0LYrf2bV1jIDdOa
	IeIoyMhE009oXkb+65zDSmG6/+Z+yLLor+Nm4p/P4GOAraXCEwtFFGgs1dF2UQeRq23biAN1ahK
	+ZKlIAIKPNou2qv3FW5+eyaZPwVSjf2DAs/cf/kb9xElw/TdN8OlJNIogV9JPora1B3KMGkGPUv
	xBhAi9CsSOOND
X-Received: by 2002:a05:7300:818a:b0:2b7:2f29:64a7 with SMTP id
 5a478bee46e88-2b764219755mr524696eec.2.1769354452804; Sun, 25 Jan 2026
 07:20:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com> <2026012214-magician-mashed-c84c@gregkh>
In-Reply-To: <2026012214-magician-mashed-c84c@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 16:20:40 +0100
X-Gm-Features: AZwV_QgzFiqzLhNK0ww7BWDwij1rh3qhFQ6JeV5d_XcAUIbg6VfQxguuHu-1gRw
Message-ID: <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Luis Augenstein <luis.augenstein@tngtech.com>, nathan@kernel.org, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, maximilian.huber@tngtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-10859-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 11F8281288
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 7:35=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> Lots of different attempts, usually using bpf and other run-time tracing
> tools.  But it was determined that we already have this info in our
> build dependancy files, so parsing them was picked.
>
> If you know of a better way, that would be great!

Yes, if I understand correctly, then this should be done on the build
system side (i.e. I don't see how BPF/tracing could achieve this, so
maybe I am missing something), but what I meant is that there are
several ways to do this in the build system side.

One is this kind of post-processing after the build, which is easier
in that it avoids touching Kbuild and can be written in something like
Python, which always helps. The downside (my worry) is that it
introduces yet another layer to Kbuild.

My first instinct would have been to try to see if the build system
itself could already give us what is built while it gets built (i.e.
just like it outputs the `cmd` files). So I wondered if that was
considered.

> Changing kbuild would be great too, if you know of a way we can get that
> info out of it.

It depends on what is needed, but Kbuild of course knows about input
and output files and dependencies, so I was thinking of outputting
that information in an easier format instead of having to parse
command lines from the `cmd` files.

> It should be part of the kernel build process, and generated as part of
> it as it will want to go into some packages directly.  Having to run the
> build "again" is probably not a good idea (i.e. do you want to modify
> all the distro rpm scripts?)

Even with `CONFIG_SBOM`, they will need to modify at least their
kernel configuration, and perhaps more if they want to save the SBOM
files differently, e.g. in another package etc. So I am not sure if it
is a big difference for any distro than adding a word to their `make`
line.

Now, I understand it may be easier to tell users to "just turn one
more config", and perhaps it looks more "integrated" to them, but I
mainly asked because, to me, the SBOM is orthogonal to the kernel
configuration.

In other words, I would have expected to be able to get an SBOM for
any build, without having to modify the kernel configuration at all.
After all, the kernel image should not change at all whether there is
an SBOM or not. We also do not do that for some other big "globally
orthogonal" things that involve generating extra files, like
documentation.

I hope that helps somehow...

Cheers,
Miguel

