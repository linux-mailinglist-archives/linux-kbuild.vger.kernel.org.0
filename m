Return-Path: <linux-kbuild+bounces-5480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51988A1080F
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 14:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2483A458A
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 13:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2261E47BD;
	Tue, 14 Jan 2025 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NK/sWsyw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC2D23244B
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jan 2025 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736862257; cv=none; b=VyMuSNrt5AXI9d57G2HdhI3ZmcfZsWJa3RBDFGyzJ/lL5fHl+WPeU8Yk0zeKtPRNqmm+cSl5KUOWJ27098FzdSd1sbj9lGehBRMtjpNdwlPOxopvBXbgKA+E0q3r7PBadcHIQDfX4fpZ9NGGoQF45w0X7zp/ga9VSR3z+3xrYds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736862257; c=relaxed/simple;
	bh=5rgvP3CL6e8tZ8G8r/L0BvhYVXwLFjYwHmYVaMyABw0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AkdDOOuFFrXV/xi0qtzNf8rNV6ZdTLhAvjRb9Eb/nDgiK0zJodBw9gYkkPd4sN1S7axs4TN1ptT3M1A9NRfwhK8mG/+AWa3Bpwqa7jAQHYvlezVUN2xOHYUydg7y/YEWHbY4gxBPPLeezby3/3HAgLjY8ak18S03Oq44QhZW6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NK/sWsyw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43635796b48so34106935e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jan 2025 05:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736862253; x=1737467053; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5rgvP3CL6e8tZ8G8r/L0BvhYVXwLFjYwHmYVaMyABw0=;
        b=NK/sWsyw6dIEdwa2h0jMZwMJ9P/Yovk0rZ8cQa3IX4P4wH4zU6acIZ5MiBd7oM8yJa
         KABEt+S+gmj/1tJsGaj73Tp6sV1/v2VfdWrOVFJ5Abc4/1IBf9njKCFfMfT5XI7sAOnm
         NpHQ3uZSPteqULe51fo0V72NMaxkaAs6LJZeabTKH1sj8IxWJ+L4U3XUKB3ZzlHtvi2b
         29bUeVedKvHRrW2yXfAOB5F0N6s/TG4BzTZpse2Rsxs2yBnBB+kGmcvCir5DqD297twV
         G1ilAdWOUfWsFfepbonvp25CboL/s2kJuHbhvyC4v6jqbayu6OIIu0PBzvRZ9wi7DuVN
         rHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736862253; x=1737467053;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5rgvP3CL6e8tZ8G8r/L0BvhYVXwLFjYwHmYVaMyABw0=;
        b=v8n1cqhXbCZAG9XNQ1zbVrGVlCKSXMw7Od2acRRloZmNhBnCkz08YiOlyHGUnpc3Nx
         TqPExtn9CxqmVaL6fDFfbQ4YfN62IzcwZ7U41qMUy4fjDCWJlgNXSPC+SNIdvr6r1BPE
         pYPG7fGQ3ROGraP3rI4o2e3RbNn/di9kNWDth5p9G4mlKdZsk+8GYQG8UOSsW5vPwKJF
         Bfv6ma/oIyI/0ql2QIe6zjkan5bbXhFJPtAB6t6e8ty92yZmfKgC1lJbTjtax+9I5F6u
         3hqbIV5FJnYHAFWgETniQbAKaRWtpCgvbcmTGZ1QOKwjn4vuncq4wWR6my60Xr2pC589
         hy3w==
X-Forwarded-Encrypted: i=1; AJvYcCUodyDINp5acQIO2o2k2Ezc4d5ZPEyLkjPAMd/T5pN2lW6d0SlJdbCEc8Z2FdG82Qhyzji5MY0lgJhgGcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsMpCGP+LGcRu03deTWbNkOFxkfYiTb9PWRG+1xtQgHd7Bb3JD
	b6keCcaVCgQBIAlqQPj4b6CuxsWRJt+GyQv47OKWb+Nic+pTF2TPTzM/35CPjKo4fZUG8PmDQ/W
	d
X-Gm-Gg: ASbGncui+/+E0u2MfF+Gj2nLWog8rHvROPrByDyoUZ9wM8B5+Sr5pFcFwc8Ptcs8sUj
	bjLnv60HEtF1vd/k8PhxUtMh3Cy70s+pn4OWIv5kwMwu85NtwuAZ5v21TULYn+xwkrWKQvekXHK
	9LmfEzI03gw/Pf8CmchBs8NcpgYx3/it3/pKsV9rsPoKZZ6yvm8z7obeLZ2WNMm8aUWTVuOp4yK
	vCmW63XNG1VyJsvcA1cmIphJDNSazWhayDZq5xo3qZpqBQ1M1yuWW1T+d/0aZr0FDk5m+8puxtH
	yFB/BxA3S6A=
X-Google-Smtp-Source: AGHT+IEZhrj+wcrDXhZyxO7ZT5immwSf6uWMEHf31vKRmwpvuzcK6uktENqk4UDD9d6ZJg5nK7FxVQ==
X-Received: by 2002:a7b:cc05:0:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-436e881e844mr175807655e9.4.1736862253209;
        Tue, 14 Jan 2025 05:44:13 -0800 (PST)
Received: from [192.168.3.33] (127.36.160.45.gramnet.com.br. [45.160.36.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d46sm174780165e9.25.2025.01.14.05.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 05:44:12 -0800 (PST)
Message-ID: <2886d7bc245fc440982e5ea295e7c603f9fdb9d8.camel@suse.com>
Subject: Re: # Toplevel Makefile doesn't process module build correctly on
 recursive make calls
From: mpdesouza@suse.com
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Marcos Paulo de Souza <mpdesouza@suse.de>, linux-kbuild@vger.kernel.org,
 	mbenes@suse.cz
Date: Tue, 14 Jan 2025 10:44:07 -0300
In-Reply-To: <CAK7LNASRo7C5sKVcmKv_8R449STTydUGbhtHycpp=7E7qLHdcQ@mail.gmail.com>
References: 
	<CAK7LNATLv2KSWo0BnFGXi73GVdnvc1EX23TvTkKT1U-krgBnNQ@mail.gmail.com>
	 <20250113193756.721489-1-mpdesouza@suse.com>
	 <CAK7LNASRo7C5sKVcmKv_8R449STTydUGbhtHycpp=7E7qLHdcQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-01-14 at 21:36 +0900, Masahiro Yamada wrote:
> On Tue, Jan 14, 2025 at 4:38=E2=80=AFAM Marcos Paulo de Souza
> <mpdesouza@suse.com> wrote:
> >=20
> > On Sat, 14 Oct 2023 17:35:55 +0900 Masahiro Yamada
> > <masahiroy@kernel.org> wrote:
> >=20
> > > On Tue, Oct 10, 2023 at 5:43=E2=80=AFAM Marcos Paulo de Souza
> > > <mpdesouza@suse.de> wrote:
> > > >=20
> > > > Hi all,
> > > >=20
> > > > I found an issue while moving the livepatch kselftest modules
> > > > to be built on the
> > > > fly, instead of building them on kernel building.
> > > >=20
> > > > If, for some reason, there is a recursive make invocation that
> > > > starts from the
> > > > top level Makefile and in the leaf Makefile it tries to build a
> > > > module (using M=3D
> > > > in the make invocation), it doesn't produce the module. This
> > > > happens because the
> > > > toplevel Makefile checks for M=3D only once. This is controlled
> > > > by the
> > > > sub_make_done variable, which is exported after checking the
> > > > command line
> > > > options are passed to the top level Makefile. Once this
> > > > variable is set it's
> > > > the M=3D setting is never checked again on the recursive call.
> > > >=20
> > > > This can be observed when cleaning the bpf kselftest dir. When
> > > > calling
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ make TARGETS=3D"bpf" S=
KIP_TARGETS=3D"" kselftest-clean
> > > >=20
> > > > What happens:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. It checks for some co=
mmand line settings (like M=3D)
> > > > was passed (it wasn't),
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set some definitions and=
 exports sub_make_done.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. Jump into tools/testi=
ng/selftests/bpf, and calls the
> > > > clean target.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3. The clean target is o=
verwritten to remove some files
> > > > and then jump to
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_testmod dir and call=
 clean there
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4. On bpf_testmod/Makefi=
le, the clean target will
> > > > execute
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 $(Q)make -C $(KDIR) M=3D$(BPF_TESTMOD_DIR) clean
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5. The KDIR is to toplev=
el dir. The top Makefile will
> > > > check that sub_make_done was
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 already set, ignoring th=
e M=3D setting.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6. As M=3D wasn't checke=
d, KBUILD_EXTMOD isn't set, and
> > > > the clean target applies
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to the kernel as a whole=
, making it clean all generated
> > > > code/objects and
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 everything.
> > > >=20
> > > > One way to avoid it is to call "unexport sub_make_done" on
> > > > tools/testing/selftests/bpf/bpf_testmod/Makefile before
> > > > processing the all
> > > > target, forcing the toplevel Makefile to process the M=3D,
> > > > producing the module
> > > > file correctly.
> > > >=20
> > > > If the M=3Ddir points to /lib/modules/.../build, then it fails
> > > > with "m2c: No such
> > > > file", which I already reported here[1]. At the time this
> > > > problem was treated
> > > > like a problem with kselftest infrastructure.
> > > >=20
> > > > Important: The process works fine if the initial make
> > > > invocation is targeted to a
> > > > different directory (using -C), since it doesn't goes through
> > > > the toplevel
> > > > Makefile, and sub_make_done variable is not set.
> > > >=20
> > > > I attached a minimal reproducer, that can be used to better
> > > > understand the
> > > > problem. The "make testmod" and "make testmod-clean" have the
> > > > same effect that
> > > > can be seem with the bpf kselftests. There is a unexport call
> > > > commented on
> > > > test-mods/Makefile, and once that is called the process works
> > > > as expected.
> > > >=20
> > > > Is there a better way to fix this? Is this really a problem, or
> > > > am I missing
> > > > something?
> > >=20
> > >=20
> > > Or, using KBUILD_EXTMOD will work too.
> >=20
> > So it worked until 13b25489b6f8bd73ed65f07928f7c27a481f1820
> > ("kbuild: change working
> > directory to external module directory with M=3D"). Right now, it
> > shows the same
> > error as reported before:
> >=20
> > m2c=C2=A0=C2=A0=C2=A0 -o /home/mpdesouza/git/linux/scripts/Makefile.bui=
ld -e
> > /home/mpdesouza/git/linux/scripts/Makefile.build
> > /home/mpdesouza/git/linux/scripts/Makefile.build.mod
> > make[6]: m2c: No such file or directory
> >=20
> > To reproduce, it's just execute the livepatch ksefltests:
> >=20
> > $ make kselftest TARGETS=3Dlivepatch KDIR=3D<kernel source top dir>
> >=20
> > Is there something that we can do in this case to solve this issue?
>=20
> The following may work although I did not test comprehensively.

Unfortunately it didn't work:


$ make LLVM=3D1 kselftest TARGETS=3Dlivepatch
KDIR=3D/home/mpdesouza/git/linux
/home/mpdesouza/git/linux/Makefile:740:
/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_module

s/include/config/auto.conf: No such file or directory
make[5]: *** [Makefile:243: __sub-make] Error 2
make[4]: *** [Makefile:19: modules] Error 2
make[3]: *** [../lib.mk:146: gen_mods_dir] Error 2
make[2]: *** [Makefile:197: all] Error 2
make[1]: *** [/home/mpdesouza/git/linux/Makefile:1402: kselftest] Error
2
make: *** [Makefile:243: __sub-make] Error 2


>=20
> I don't know why kselftests need to be started from multiple
> places (top directory and tools/testing/selftests/).

Well, I'm not sure why as well, but it's a requirement that it should
work for all kselftests targets...

>=20
>=20
> diff --git a/tools/testing/selftests/lib.mk
> b/tools/testing/selftests/lib.mk
> index d6edcfcb5be8..5587ace31b9e 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -143,7 +143,7 @@ else
> =C2=A0endif
>=20
> =C2=A0gen_mods_dir:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(Q)$(MAKE) -C $(TEST_GEN_MODS_DIR)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(Q)$(MAKE) sub_make_done=3D -C $(T=
EST_GEN_MODS_DIR)
>=20
> =C2=A0clean_mods_dir:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(Q)$(MAKE) -C $(TEST_GEN_MODS=
_DIR) clean
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> >=20
> > I'm quite surprised that no bots found this problem yet.
> >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > > --
> > > Best Regards
> > > Masahiro Yamada
> >=20
> > /*
> > =C2=A0* !REMOVE THIS COMMENT BLOCK BEFORE SENDING THIS MAIL!
> > =C2=A0* below are signatures added by "hkml".
> > =C2=A0* edit signatures below, or use "hkml signature".
> > =C2=A0*/
> >=20
> > Sent using hkml (https://github.com/sjp38/hackermail)
>=20
>=20
>=20


