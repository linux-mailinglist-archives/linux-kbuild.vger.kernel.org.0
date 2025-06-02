Return-Path: <linux-kbuild+bounces-7338-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E9ACAA85
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 10:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48707177F35
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 08:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AFC1C8629;
	Mon,  2 Jun 2025 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NG0g1tjm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A351A76AE;
	Mon,  2 Jun 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852694; cv=none; b=UMF17Da9Q8hBQOc9aQzcQi2gv0y3RyfVMyhcB+vKI2OBdEFpBgMEzq6kqxnIkrHp2u/cI5+wsaWlwY0BWKVuuA+vcANxZqjj2BeyW4STBNDmx5tYDzGs4djZtOPqs8PnumYSco5xIsKhNFd7iNDdXSo4fdBh39N1gjIKJQ4M1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852694; c=relaxed/simple;
	bh=f2bjqsEk+Ozq9DPGfRhLFyMt9lCLyZpETrH9STA1DbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODqSu3npL4zPgjBSjiYTfa2qwRCOaO8bL4WcgRqz5SEDskf1PY9EcZ2hA9Fs1ZX4vA6JI+R7rAaKaYfHZCbRA2RK62vUNZB9V9Mw2gU6E4odTXGkjciw5BRycoqfRI+sFwtAYk04w8g/nHLj5k1hdqSEz5KriI40bhdaw2ux8r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NG0g1tjm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94011C4CEF2;
	Mon,  2 Jun 2025 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748852693;
	bh=f2bjqsEk+Ozq9DPGfRhLFyMt9lCLyZpETrH9STA1DbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NG0g1tjm4A2EZO0/OUxoKR+fOJwSRPeNlRTC4Sd/GTA97e0Vc1bsAMDjYiK665Qsr
	 lZXisDqAV66CfizoQ4yqg2BQHMXGULv5prJVNI2Bmgjw4mR28qa7JilOVINQBfpNp+
	 nxWZ02+rxG3L1cuBeHZwG5XLaYlBgzIbBqNVSYB6ow4Ura7qVrCKSelUzDBxnn2jVi
	 azVvnfrZyK5xTtZI42lU24CqK5Yhl38cxCvaISw5bEXkfh0iYXh4xpXQU2TUis7mcQ
	 GTJSYmCWlaKSKKTwgaSvJQoWTMqcxcG37wSXXJDG33fempDi65jqn+Zz16KOGdTsKi
	 Y93UdCsSKl+pg==
Date: Mon, 2 Jun 2025 10:24:48 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
Message-ID: <aD1f0CZfbsMR61OX@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARm1+L0CrE8TYrFaipfOX4pjEJ7Uz7dn=3g+26PER6jNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARm1+L0CrE8TYrFaipfOX4pjEJ7Uz7dn=3g+26PER6jNg@mail.gmail.com>

On Mon, Jun 02, 2025 at 04:52:36PM +0900, Masahiro Yamada wrote:
> On Tue, May 27, 2025 at 6:08 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > In order to avoid symbol conflicts if they appear in the same binary, a
> > more unique alias identifier can be generated.
> >
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > ---
> >  include/linux/module.h   | 14 ++++++++++++--
> >  scripts/mod/file2alias.c | 18 ++++++++++++++----
> >  2 files changed, 26 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 88048561360f..e7506684069d 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
> >  /* What your module does. */
> >  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
> >
> > +/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>__<name> */
> 
> This format relies on module-name mangling, but
> I hope we will be able to stop doing it some day.

I didn't like this approach either when I found out how it was
implemented.

We can only add the module name to the structure to which the alias is
made. But the problem with this is that right now there is no common
structure for DEVICE_TABLE. Each module comes up with its own.

It is possible to add a common structure, but that would be a big
refactoring.

> Can we come up with a different idea
> in case <modname> contains hyphens?

The hyphen is not a problem for my implementation. In the __KBUILD_MODNAME
macro, hyphens are replaced by underscores.

scripts/Makefile.lib:

name-fix-token = $(subst $(comma),_,$(subst -,_,$1))
name-fix = $(call stringify,$(call name-fix-token,$1))
basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(modname)) \
		 -D__KBUILD_MODNAME=kmod_$(call name-fix-token,$(modname))

-- 
Rgrds, legion


