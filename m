Return-Path: <linux-kbuild+bounces-10864-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDRfMfZRdmlbPQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10864-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 18:25:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED5981979
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 18:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC139300350E
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 17:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4EB2BE65F;
	Sun, 25 Jan 2026 17:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6lGp4KK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DB42BD58A
	for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 17:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361906; cv=pass; b=s6MHm+wjO6e/Clek/g3gm5r3aqREA3OHfZiyNKs2i4uax2QxH706s/NJDHARwxlYPpdk5VORC2lJ1RsQIWSi0ZEWtfjwRynaKkTe7IXrB4GV/JisvBV6Sar0jofg/SWbN7bVQkGmmM/gimJhvwTnUpmSyeTj8IiPiJUmGW31u9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361906; c=relaxed/simple;
	bh=GSbKKFs4hXghM7vzRcR3HtZ90AX2GXPaDjGM5Ad9kCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StWd95/bxnY9NpsLFt+WBqwt6i806VOAgNbGe7ULYE16kmBBDDZoprnHvca00VN/gd3NBkhSLhbaxDs9hWFC3YuG+R/ayu/YpgVjhnQci75kKW/ewzqe7Uj6x7/0e2sg7zZjg2kkPlemTM0ryogXOVjsU2kiq/rTjuJq60dljZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6lGp4KK; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b72b154883so106211eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 09:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769361904; cv=none;
        d=google.com; s=arc-20240605;
        b=Sjg0jDvr2QEYrOo1EZQ2KA4JjAr/dQ3pt3E+89hsjIvVvOo6k+DGVsw7m6qIDIL/wx
         xUgn9ocxorcKxz4CnWAXgMPlgv9KqqB99Tp3sgGnJK01AcbGQVPhqpGBJ5gYExae4A3l
         EzgWNJaEfbScI+FQrGo3cTB+VDR10OclTM/RFukv8NZhF24iZvoJ6umrDo2qcrbMz+WO
         4XI8vV++zRzVBsXj0oZs5ZQzIwA9eHCEWef2CsD+xUul+uKTUY/ZOv+qfEU+XNRotS9j
         OAMG7M5ojZh2E77ZVQu/ERiSnnA4oCOHtweUZFS6aAoh4SltjCRBfQqaOJ9fTgSf9Obt
         EwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aBMn4u4sf89YTlViPXC89bLVjAHbnI7jaPq1/CvcMj8=;
        fh=DYzSNfKXaQXZuFXv2aJUcvZEmUfEjSq9q8XyUkJw0Ic=;
        b=i6IuFbCcU7gWsb8h77Hw8ozllq7M5QAA5X0zFhPMwjcifz+8tgktSrVQI/95Vo3DY5
         sXZKUx79HbYkS+kuapWrSa+HDwxsDsnG7uFrccGHZdfuAY6r47RDs4cJJROncTxQOnwB
         46fedtLOUDVJWcu3W3afV4JR7KHFuWVlJmCqLrcz027yybF5MG2NHyLAmW+LM6pAeHmG
         uaJnaInsl07JR8A1gYwd0R0+Xw+pmoE7RyFNAtWxpCrUWnI1LiteZaregREUtsB/AepF
         lPBdfNdNhgBYgCkZv3JEnKk+O+xbgaAdC3TJCH2KM2xk8AvnUMGq3ws61nEcCjXwY3zx
         8nBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769361904; x=1769966704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBMn4u4sf89YTlViPXC89bLVjAHbnI7jaPq1/CvcMj8=;
        b=L6lGp4KK9a7gxE3AufyQUiPC3aulavlIvS3oV4wVaE0IfEJKAmlsLUtjGsXrYej+v2
         SVo2rHqbQVPGCXrEmcfI2tmBmyQHIvbe7hydf8+wF+0yZW2c8FsnJW77YsY93j1Xof2t
         k5q1ew5/K72tBOSBynPfJCg9BdA1WGYipS1NsJZok+Kj/IuafvDjxIvAlxP2sm96k2Us
         J6+JOuElfIEBNIg7NsKujlao0kRic4E3n5vXshcL1ztJ/8m1wyIDRyNZO3UYgMgCfGGr
         3z6QnDwiZiBzGK5hQY16KPXvkRW3DWLc9L7PWk2rAhxkxhzTH5nqOQOxy4rKTJ40RFH9
         Ws9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769361904; x=1769966704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBMn4u4sf89YTlViPXC89bLVjAHbnI7jaPq1/CvcMj8=;
        b=LZWoHYk9xzTJ4BOgp5fmF97LRINFVLu8A79IDq/85TfxNw+R2v4rmOmNqm0/lY0/RY
         /PhwYXePfZ4sVFAaf1gxVABVus8vYeMVXN7ToBgd77z6gRjSPpIIRuBTwbMAjU0WcGma
         yMvBb0/ku6r/WOpTfOq+E8UBejj6EXMrOV/YoUqG9ftE7Du0JMLTKPRqEYCE0l0fjNRo
         ut82o+6phDr+M2AsALsxOy8CLvJyNJaOg+cDtqd6glxKna08Sb2cdsu+iRwBy+gBHVGH
         PmADRlrGnzcDvJ8txTsLzpene2+bj6Fn83fiGwy68IZ/2rg7t01nH2I02BiASi0mzG6J
         uPNw==
X-Forwarded-Encrypted: i=1; AJvYcCXYOY3o3sWLvkIWvR5vQRX3vBag2jiCIX+EikXuUqe43WsuQsKg0y7k/I0CVEpLZZKkOm0v+lUbZDSANPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhxoxv9OJSULMKi8t3p5F8q1km8g2g1nwjxR9i7ElAsUidfPnc
	HsnBx00I92kPsqOgu8q9hFf8Hb0SIEqq2pXz6dYt0p+hQkL+TxeMJ4/Tsqom0h8HCXkSLBanTG+
	TwUyFGTPLuTQcDHeMliT9MRz/K3RCsYE=
X-Gm-Gg: AZuq6aJZesS3DyaiT0o5koMtJ2bZlFfsOU/dp1hMEwjkz/WjX38JKG+lWIQtNxXdV9i
	wOG5c+EmwdHvnhHAd+v7WcjYAwMMW+I2iuHpA6f3YGVVKXOhfEPW6BorxfMsTf66JvqdIEf/LAi
	7vJwd+UzR2Vomi1HAzhNCUCwZxUe7MsEfqvSOqOR1ANaBNUXlCY6fvFfH0Ksx0JowF8Wip7tfEK
	DhZ0qkfuL+bvaD+o2LqmZlsibgfZgMQZblm376iBQ1ahpScxxrpEHfDXAktrKVxUx2ANbGSEQdd
	T9os/SX1Thq6sHoMTQAbqkkqjY2vtha6jgHcwkzdpNjxj17PUZ/nhiFiZmRuJUO6cq/08ssSnQy
	V/CegekwSf/+B
X-Received: by 2002:a05:7300:fd05:b0:2b0:4a1a:657 with SMTP id
 5a478bee46e88-2b764827c0amr481168eec.8.1769361903820; Sun, 25 Jan 2026
 09:25:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh> <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
 <2026012533-preflight-surviving-43e5@gregkh>
In-Reply-To: <2026012533-preflight-surviving-43e5@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 18:24:51 +0100
X-Gm-Features: AZwV_Qhik5ySt1101VQnTUxyAggLygBXFHInYsVeJelxQrvQmQfIqwtP7Tv_D94
Message-ID: <CANiq72=_tPP4cPaUMPiM14h1kk97EXSf5vg-yHHYo-Px+31ZSg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-10864-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 2ED5981979
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 4:34=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> for a horrible hack of an example of how you can do this using
> bpf/tracing, see this "fun" thing that I use every so often:
>         https://github.com/gregkh/gregkh-linux/blob/master/scripts/trace_=
kernel_build.sh
> it uses bpftrace to inject a script and then do a build and then
> post-process the output.  Not something you should ever do on a "real"
> build system :)

Oof... So you really meant tracing the builder. :)

> That's what is happening here, it's post-processing the build files to
> detetct the dependancy graph it already knows about.

Yeah, I am aware -- I mentioned both sides to explain the upsides and
my worry about hardcoding all this stuff out of band.

> cmake can do this, that's what Zephyr uses, but we don't use cmake for
> kernel builds.  I know the gnu toolchain developers have talked about
> adding this to make/gcc/whatever in the past, and I thought Red Hat was
> funding them to do that, but it seems to have never gone anywhere and
> it's been years since I last heard from them.

Well, Make can ""do"" things like that, in the sense that we can
program it, which is essentially what Kbuild does -- it "hacks" the
usual Make graph to do extra stuff on top.

i.e. Kbuild and friends are the ones writing the `.cmd` files and
running custom filtering and so on, not Make, and just like we abuse
Make to do that, in principle we could encode and output more
information (if that would help).

To be clear, I am not sure exactly what information it is needed --
when I was Cc'd for the Rust bit, I noticed it was parsing the command
line to try to guess more deps (?), which seemed odd and I wondered
whether we could provide that (even if it requires additions) so that
we don't need to parse those.

> And kbuild already encodes this information in the cmd files, for the
> most part (there are corner cases and exceptions which the developers
> here have gone through great lengths to track down and document in the
> scripts.)

By "corner cases and exceptions", I assume you mean the hardcoded ones
(not the command line parsing), which I hadn't noticed yet.

Those aren't really documented from what I can see? It is just the
list of cases, which we will also have to maintain.

I also see the `.incbin` now, which is even more hardcoding, but I see
Makefiles explicitly adding the dependency on their side, which is
closer to what I am saying: that it would be better to add the
dependencies (or whatever information is needed) in the build system
side.

In other words, we could make those generate a `.cmd` file or similar,
rather than hardcode it on the script.

I guess my question to Luis et al. is: for things like `.incbin` and
the hardcoded dependencies, is there a reason to avoid declaring any
missing dependencies or to generate the `.cmd` files to begin with?

The patches say, for instance:

    Some files in the kernel build process are not tracked by the .cmd
dependency mechanism.
    Parsing these dependencies programmatically is too complex for the
scope of this project.
    Therefore, this function provides manually defined dependencies to
be added to the build graph.

And my point is precisely that we should not be parsing Makefiles, but
neither command lines, if at all possible. Instead, if there are
missing dependencies, we should fix them; and if there are missing
`.cmd`s (i.e. dependency information not saved) you need, we could add
those, and so on.

> So 99% of the info is there already, which is why the cmd
> files are used for parsing, no need to re-create that info in
> yet-another-format, right?

Yeah, the extra information may be just in `deps_` in the `.cmd`, or
it could be an extra variable there or whatever is needed, i.e. no
need for a new format.

i.e. what I was trying to avoid was the out-of-band hardcoding as much
as possible.

> Let's stick with a config option for now please.  If the distros who
> will need/want this decide to do it in a different way, they can send
> patches :)

In case it wasn't clear: for the config bit, it wouldn't be a big
change -- it would just require removing ~10 lines unless I am missing
something.

But if this was already discussed with users or you think it will be
easier etc., then fine, I won't press. :)

> It's a build-time output, just like debugging symbols are, and
> documentation.  Ok, documentation is a separate build target, and "to
> the side" of the source build, but you get the idea :)

Just in case: debugging symbols are different -- they change the
actual build (e.g. flags), and even the actual image (unless requested
to be separate). So those make sense as a config option.

(We also have other targets that work like docs, i.e. it is not just
docs. But fine... :)

> The SBOM is directly tied to the kernel configuration in that it needs
> to know the config in order to determine exactly what files were used to
> generate the resulting binaries.  That's what the SBOM is documenting,
> not "all of the files in the tarball", but just "these are the files
> that are required to build the binaries".  Which is a tiny subset of the
> overall files in the tree, and is really, all that the target system
> cares about.

To clarify, I didn't suggest we document the files in the tarball, nor
that the kernel config doesn't influence the SBOM contents.

What I am saying is that whether an SBOM is generated or not is
orthogonal to the kernel configuration, and as a user I would have
expected to be able to obtain one in my build without having to change
any configuration.

I hope that helps.

Cheers,
Miguel

