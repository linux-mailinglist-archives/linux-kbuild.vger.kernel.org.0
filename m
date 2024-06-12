Return-Path: <linux-kbuild+bounces-2094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A1904AF0
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 07:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8980CB21DDD
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 05:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC74231A83;
	Wed, 12 Jun 2024 05:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bdnt36Fu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA84286A8;
	Wed, 12 Jun 2024 05:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170418; cv=none; b=EpRs+wWT3q9u8VlyH2NY7PivZ1hkfS3h568YhTa0p/bpvci20y2LhdNSzH31ERLHqY7efrFiUgm5AzKEDg4KkCtPEYjWRy8f1p+ivgs+RDXyZHsOTbo5HwU7BfY8pqCupZkwUqCoCWB3oevQZjhRMELr0l0ajIl7SKfAarqnEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170418; c=relaxed/simple;
	bh=QA8GIOmVqYf9KP6R4KWEORc/DcfRQQKauwadf4wqiEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcFJvmceEKKADXjvOIBeI7ut5FRIJ6Poe10iDi2AvMmSlAwMda7xjnkmTzwbX7J9f9pqCIyjKc7QJNuE6asqoxJRDmKZBEEnqbb7uYZQ8bs4gliX10+hrsHsG0TLPfiw0GV54qYW42WRNqaHx7/Zq4oLG0v8AdRF6bN0b3aqERA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bdnt36Fu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675FDC4AF48;
	Wed, 12 Jun 2024 05:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718170418;
	bh=QA8GIOmVqYf9KP6R4KWEORc/DcfRQQKauwadf4wqiEY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bdnt36FuN4I6cEalFhByTOtKKz3px/tnhaY9eAmimcscGqXMCp3RYsGXKIVTAVBPK
	 mo68j1Co8k8BDHaIlgC7zKw9nI2uNcXudyFXrJ6gmw4qwLMdGd/fhrkhGQBzaU0VcH
	 vD8ea9EnQJV4Dpdph9n9OYynCNLqaMkVjyFJ9l5EfGbFU+k5a4PgW6WUofZ5yP11fv
	 2LXntUbImvugE8lqIRK6OqD2NimNYQOe0DMltrumD6XZJV4AQtCBW6AWUiCAGZ3kN7
	 D4608kqsfzPtK89yQKRVDOmca/668C38iQiYvhs5d1kL0IE6gedRl7EEvQ6NOoYyhE
	 C/fEfidZNwS/A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c7fbad011so4438476e87.0;
        Tue, 11 Jun 2024 22:33:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWT9FSFOvv2+swu9VTsuzi5/5jGFdRhl7PcbTwOaBd0sx2XDfDQK+6p/7tzwljL2YT9O8qxf3gLfw/hTraS/HLvSxvQdw0p3JkrqdYj
X-Gm-Message-State: AOJu0YwksUS3MC1z5ECRrchvwx9DPnvLkwG8CBzo13Goo39LVvSRQpbV
	wbjjfqVbLPpsj4new7KEBj0C4FbbaI0w0ZrVvYNXPYRC7591YLvQlCIon9Bet4AGZMLuyk+R5WZ
	pa/bWKJsajBL4URGgGMscy40sMGI=
X-Google-Smtp-Source: AGHT+IGTCD+VoH9nmOnzfnKaJ0wG5s+PkBBuSIOcAMw3Fmo4Jn6vzUZ1qSob8ucAlKQlqyirIfGPgVcsKBlepnIVQh0=
X-Received: by 2002:a05:6512:3f01:b0:52c:8933:d743 with SMTP id
 2adb3069b0e04-52c9a3fcb3dmr578510e87.47.1718170417110; Tue, 11 Jun 2024
 22:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611175536.3518179-7-masahiroy@kernel.org> <202406120445.P5QmPYgD-lkp@intel.com>
In-Reply-To: <202406120445.P5QmPYgD-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Jun 2024 14:33:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNASAoHeZ38oEVxC97QapeE2Fv9TROhorrNW00_emxyHQHA@mail.gmail.com>
Message-ID: <CAK7LNASAoHeZ38oEVxC97QapeE2Fv9TROhorrNW00_emxyHQHA@mail.gmail.com>
Subject: Re: [PATCH 06/16] kconfig: refactor choice value calculation
To: kernel test robot <lkp@intel.com>
Cc: linux-kbuild@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 6:19=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Masahiro,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on masahiroy-kbuild/kbuild]
> [also build test WARNING on masahiroy-kbuild/for-next next-20240611]
> [cannot apply to masahiroy-kbuild/fixes linus/master v6.10-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/kc=
onfig-remove-unneeded-code-in-expr_compare_type/20240612-020202
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git kbuild
> patch link:    https://lore.kernel.org/r/20240611175536.3518179-7-masahir=
oy%40kernel.org
> patch subject: [PATCH 06/16] kconfig: refactor choice value calculation
> reproduce: (https://download.01.org/0day-ci/archive/20240612/202406120445=
.P5QmPYgD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406120445.P5QmPYgD-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> scripts/kconfig/symbol.c:448:3: warning: label followed by a declarati=
on is a C23 extension [-Wc23-extensions]
>      448 |                 struct menu *choice_menu =3D sym_get_choice_me=
nu(sym);
>          |                 ^
>    1 warning generated.
>


OK.
I will move it to the top of the function.



iff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index b4d085342b94..063a478197e0 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -383,6 +383,7 @@ void sym_calc_value(struct symbol *sym)
 {
        struct symbol_value newval, oldval;
        struct property *prop;
+       struct menu *choice_menu;

        if (!sym)
                return;
@@ -428,7 +429,7 @@ void sym_calc_value(struct symbol *sym)
        switch (sym_get_type(sym)) {
        case S_BOOLEAN:
        case S_TRISTATE:
-               struct menu *choice_menu =3D sym_get_choice_menu(sym);
+               choice_menu =3D sym_get_choice_menu(sym);

                if (choice_menu) {
                        sym_calc_choice(choice_menu);












--=20
Best Regards
Masahiro Yamada

