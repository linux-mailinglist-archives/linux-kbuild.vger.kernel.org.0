Return-Path: <linux-kbuild+bounces-9078-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A05BCE503
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 20:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91AA219A7C8B
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 18:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31CD301031;
	Fri, 10 Oct 2025 18:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4HSSVjd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797392FFDDD;
	Fri, 10 Oct 2025 18:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122634; cv=none; b=tLg3yQK6FX5diE0MCVD8hihU8aKCg1MiuX9V7rMqRtq5uK+1YWpRCTpm1o/qUo+13dxDgyHklgrpr3UniKM3sqT/4xMIfqmAwlbNLna0rAvnkN1FTIbJSru9biNJP94FbRC8Cq3BMSu9dQdm4Eg1aiHbIN1ENBoZTGr3BL30FA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122634; c=relaxed/simple;
	bh=ZWiwgPqFl4kJIv8hN4zbksDRXI5ge4GqvCeEn7Pm9mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPynITT5pWplA9YRRPSQhijpQYo4o793hIxHri1uW2EOd96p8j9NASkOAi0TLloSB9eRGAPbhIAOrP2migxw0HcKVyKphFoWmAsUJ+CGP/N9N/kC2CTrebA+NcqzxjCRHsEVoI6irWtUcPn9L28oGBYF3O1U52ENLHlwu3oGQ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4HSSVjd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9130C4CEF1;
	Fri, 10 Oct 2025 18:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760122634;
	bh=ZWiwgPqFl4kJIv8hN4zbksDRXI5ge4GqvCeEn7Pm9mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4HSSVjddvJlegTciMwjbzMjZM6ixaGQGb+ygez32yrlKBUEyCirLYcgvcXHM5zAN
	 hDBs2AzpmK8ymsnHJLdH/vLrVoyLrdg3+AkQyGmWkbwYZ6mkgmEOCeJYIUSYhL6tmt
	 Wr4tgRDy24bf33KauJT0snzeJOo5KiKLiUoM9L8OEb2Tkh7oBnhSOlsSBXIBDz2pPh
	 jDNxM6pdewu5+fKrjX56XfW49CGoZFAHzoG6SyhXnaI6QeHxQdpHx/T4tHwFbghCTI
	 2wY72cjBCjQ0t2mKNrX19pRhlNeW2bpeq4L1SeJUhD8hX/bsArgKjNt6QbEVyarDrO
	 XaMRAoDY0r6XQ==
Date: Fri, 10 Oct 2025 20:50:10 +0200
From: Nicolas Schier <nsc@kernel.org>
To: "Hong, Yifan" <elsk@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, kernel-team@android.com,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: use $(obj)/ instead of $(src)/ for COPY
Message-ID: <aOlVYtE-aPpptqh5@levanger>
References: <20251006193839.1350626-1-elsk@google.com>
 <aOd6QzKQKcYoxMf0@levanger>
 <CAABy=s0yZ3BOOUHpEf1DXatYkSyk1hUwHVBmBAke7Tdvzn3AVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABy=s0yZ3BOOUHpEf1DXatYkSyk1hUwHVBmBAke7Tdvzn3AVA@mail.gmail.com>

On Thu, Oct 09, 2025 at 02:16:20PM -0700, Hong, Yifan wrote:
> On Thu, Oct 9, 2025 at 2:16 AM Nicolas Schier <nsc@kernel.org> wrote:
> >
> > On Mon, Oct 06, 2025 at 07:38:38PM +0000, HONG Yifan wrote:
> > > Similar to
> > > commit 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common pattern rules")
> > >
> > > This change updates the COPY rule to use $(obj) instead of $(src). This
> > > makes Kbuild rules like
> > >
> > >     always-y += libfoo/.foo.o.cmd
> >
> > This is a strange example.  Why should we ship any prebuilt .*.o.cmd file?
> 
> When one ships the .o file, it might be beneficial to also ship the
> accompanying .o.cmd file
> so that compdb may work, I guess. Though, I just get this example from one
> of the SoC manufacturers, so I actually don't know the true reasoning
> behind it. I agree that it
> isn't a good example.
> 
> Still, this applies to any file that does NOT match any existing
> pattern rules in Kbuild. It might be more
> generic if I had said instead
> 
>     always-y += libfoo/foo.xyz
> 
> ... and we were providing a libfoo/foo.xyz_shipped in the source tree.
> 
> >
> > >
> > > work when the user provides libfoo/.foo.o.cmd_shipped, even when obj and
> > > src is different and src is an absolute path. This is useful when foo.o
> > > and .foo.o.cmd are checked-in as prebuilts.
> > >
> > > (Admittedly, `always-y += libfoo/.foo.o.cmd` is not recommended in
> > > kbuild/modules.rst, "Several Subdirectories".)
> > >
> > > For example, if
> > >
> > >     obj=.
> > >     src=/some/path
> > >
> > > then the original rule
> > >
> > >     $(obj)/%: $(src)/%_shipped
> > >
> > > expands to
> > >
> > >     ./%: /some/path/%_shipped
> > >
> > > And when matching against the above example, the stem is just `bar.o`
> > > [^1] so the following is looked up:
> > >
> > >     libfoo/.foo.o.cmd: libfoo//some/path/.foo.o.cmd_shipped
> > >
> > > ... and it cannot be matched.
> > >
> > > With this change, the rule expands to
> > >
> > >     ./%: ./%_shipped
> > >
> > > ... and it should work, at least for files that does not have a more
> > > specific pattern rule.
> > >
> > > NOTE: that after this change, code like
> > >
> > >     bar-y += libfoo/foo.o
> > >
> > > ... with libfoo/foo.o_shipped provided still DOES NOT work, because
> > > the pattern rule $(obj)/%.o takes priority. For .o_shipped files,
> > > the user still needs an explicit `$(obj)/%.o: $(obj)/%.o_shipped` rule
> > > in its own Kbuild file.
> > >
> > > [^1]: https://www.gnu.org/software/make/manual/html_node/Pattern-Match.html
> > >
> > > Signed-off-by: HONG Yifan <elsk@google.com>
> > > ---
> > >  scripts/Makefile.lib | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > index 1d581ba5df66..e066b7b00bcc 100644
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -272,7 +272,7 @@ endef
> > >  quiet_cmd_copy = COPY    $@
> > >        cmd_copy = cat $< > $@
> > >
> > > -$(obj)/%: $(src)/%_shipped
> > > +$(obj)/%: $(obj)/%_shipped
> > >       $(call cmd,copy)
> >
> > No, I don't see a reason to support *_shipped files from the build tree.
> > The purpose of *_shipped is to deliver prebuilt files with the source
> > tree to allow or simplify building the corresponding output files.
> 
> The goal is not to support .o_shipped files from the build tree,
> though it is indeed one
> side effect of the patch. My goal is that we support .o_shipped files
> from the source tree when all
> of the following is true:
> 
> - We are building with O= / MO=, so $(obj) and $(src) are different,
> and in this case $(obj) is `.` and
>   $(src) is an absolute path);
> - We have a `xxx-y += libfoo/bar.o` line; in other words, the
> bar.o_shipped file is in a **subdirectory**
>   libfoo below the directory of the Kbuild file. As I said in the
> commit message, this is NOT recommended
>   (kbuild/modules.rst, "Several Subdirectories"), but it is a
> documented way to include a .o file from
>   elsewhere.
> 
> And as I said in the commit message at the end, unfortunately this
> patch still can't achieve this goal for .o files,
> only for files that don't match any existing pattern rules, like .cmd
> files for example.
> 
> Would you please suggest how we can support .o_shipped files in a
> subdirectory when building with
> $(obj) = . and $(src) = <some absolute path>? Thank you!

Thanks for the clarifications.  Please note that shipping .o_shipped
files with upstream Linux will not happen out of obvious reasons, and I
am not willing to invest time into supporting any closed-source
approach.

You might want to try to add the missing rules to your local modules'
Kbuild file, e.g. something like

$(obj)/%.o: $(obj)/%.o.cmd

$(obj)/%: $(src)/%_shipped | $(obj)/%.o.cmd
	$(call cmd,copy)

(not tested, no support).

Good luck and kind regards,
Nicolas

