Return-Path: <linux-kbuild+bounces-5843-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BBFA3E168
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 17:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56939420AA5
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 16:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C38212D83;
	Thu, 20 Feb 2025 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b41m+xP+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6F1FE45B;
	Thu, 20 Feb 2025 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070169; cv=none; b=qiuvNfuwlkDZ6gAdwm6E47BhvkLnNFJ2F3HFnl88NmfBN2nx4jU4vzdeVnEqAUBLEPu9hdMZvD7TGSVRM55l76HMW3+mftV+t0iuqTid14TGajfm2wcbBFiIgGxjNVwF8l0Rm50+YjiM81+2oqFbPlOx2Jw4SEPI9jLqPExrsx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070169; c=relaxed/simple;
	bh=NyaKtCp9XVV3XhUKdIR4g8VrMV+o03TRilenlKrY/l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Digk4GZ4HkIflmDHrchtUwCvn1kvecyy7NjHY4NW+SEUOpbNVmvKLLOPbnBN8Ic9vvQXjii7hGaYGxQr+7/G2OEovk9oxua6qF6Y9BmGaUcisC+RNU3CPFD/f/CKdGxqDl5b83FhvIY3rFHMtEoacEdjlnmKGKN7KSmBZD6N/EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b41m+xP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FFBC4CEDD;
	Thu, 20 Feb 2025 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740070169;
	bh=NyaKtCp9XVV3XhUKdIR4g8VrMV+o03TRilenlKrY/l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b41m+xP+Yyeb9OzIWmjHiDtiVXMqOtQmSKw0q8KPSXT70eAxuaIMD8VlHx/iXYQTK
	 Lv2fhOHeppLtLuVabku1v4YMq0zhARLK4OvfDfRYhYnW+NTtkyXdPje/8a+48arjTE
	 MVzx6pDtQWmpCkZndHnnxLKu0aSoeVAKPPyik1zQ=
Date: Thu, 20 Feb 2025 17:49:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Nicolas Schier <n.schier@avm.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>, regressions@lists.linux.dev
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
Message-ID: <2025022020-armband-clock-69af@gregkh>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
 <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
 <20250220-red-antelope-of-education-5417aa@l-nschier-nb>
 <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
 <20250220-kickass-famous-kittiwake-c11f5b@l-nschier-nb>
 <80cf4e9a-5d49-4bc3-8160-1b23c31d4d36@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80cf4e9a-5d49-4bc3-8160-1b23c31d4d36@quicinc.com>

On Thu, Feb 20, 2025 at 09:31:14AM -0700, Jeffrey Hugo wrote:
> On 2/20/2025 8:54 AM, Nicolas Schier wrote:
> > On Thu, Feb 20, 2025 at 08:03:32AM -0700, Jeffrey Hugo wrote:
> > > On 2/20/2025 3:03 AM, Nicolas Schier wrote:
> > > > On Tue, Feb 18, 2025 at 01:25:38PM -0700, Jeffrey Hugo wrote:
> > > > > On 7/27/2024 1:42 AM, Masahiro Yamada wrote:
> > > > > > Exclude directories and files unnecessary for building external modules:
> > > > > > 
> > > > > >     - include/config/  (except include/config/auto.conf)
> > > > > >     - scripts/atomic/
> > > > > >     - scripts/dtc/
> > > > > >     - scripts/kconfig/
> > > > > >     - scripts/mod/mk_elfconfig
> > > > > >     - scripts/package/
> > > > > >     - scripts/unifdef
> > > > > >     - .config
> > > > > 
> > > > > Please revert this (the removal of .config).
> > > > > 
> > > > > I got some strange reports that our external module install broke, and
> > > > > traced it to this change.  Our external module references the .config
> > > > > because we have different logic for the build depending on if other, related
> > > > > modules are present or not.
> > > > > 
> > > > > Also, it looks like this broke DKMS for some configurations, which not only
> > > > > impacts DKMS itself [1] but also downstream projects [2].
> > > > > 
> > > > > While DKMS may be updated going forward to avoid this issue, there are
> > > > > plenty of affected version out in the wild.
> > > > > 
> > > > > Also, I haven't surveyed every distro, but it looks like Ubuntu still
> > > > > packages the .config with their headers in their upcoming "Plucky" release
> > > > > based on 6.12.  I suspect they wouldn't do that if they didn't feel it was
> > > > > needed/useful.
> > > > > 
> > > > > -Jeff
> > > > > 
> > > > > [1]: https://github.com/dell/dkms/issues/464
> > > > > [2]: https://github.com/linux-surface/linux-surface/issues/1654
> > > > 
> > > > Hi Jeff,
> > > > 
> > > > do you know the related thread [1]?  According to the last mail, DKMS
> > > > has fixed its issue already in December.
> > > 
> > > DKMS tip might be fixed, but production versions are in various distros,
> > > which are not updated.  Therefore actual users are impacted by this.
> > > 
> > > What happened to the #1 rule of kernel, that we do not break users?
> > 
> > I think, Masahiro already provided valid and profound reasons for
> > keeping it the way it is.  Users of run-time kernel interfaces are not
> > affected by the change.  Concretely reported issues were, as far as I
> > know, only a matter of specific non-official way to work with .config
> > for other reasons than just building external kernel modules in the way
> > it is thought to work.
> 
> I'm CCing the regressions list, which I probably should have done initially.
> 
> I'm pretty sure Linus has indicated that as soon as users start doing
> something, that becomes the "official way".  I believe your response is not
> consistent with the precedent set by Linus.
> 
> Quoting from [1]:
> It’s a regression if some application or practical use case running fine
> with one Linux kernel works worse or not at all with a newer version
> compiled using a similar configuration. The “no regressions” rule forbids
> this to take place; if it happens by accident, developers that caused it are
> expected to quickly fix the issue."

Regressions are at runtime, not with how external tools poke around in
kernel source trees and try to make decisions.  If we were to never be
able to change our source just because there might be an external user
that we don't know of, that would be crazy.

We want users to not be afraid to upgrade their kernel, that has nothing
to do with how the kernel build is interacted with external stuff.

> As far as I understand its not acceptable to force users to change (the DKMS
> fix) or update userspace to work with a new kernel.  You could make a change
> if userspace updated, and all old versions needing the previous behavior
> were phased out of use, but we have 2 reports indicating that is not the
> case.

You are attempting to build kernel modules outside of the kernel tree,
and as such, have to adapt to things when they change.  That's always
been the case, you've had to change things many times over the years,
right?

> From the thread you pointed out, it looks like Masahiro recommends
> ${kernel_source_dir}/include/config/auto.conf as a replacement for the
> .config.  Ignoring that such a suggestion seems to violate the regressions
> rule, doing a diff of that and the .config on a 6.11 build (before the
> change we are discussing), there are many changes.  It does not look like
> that is an equivalent replacement.

What do you need/want to parse the .config file in the first place?  Why
not rely on the generated .h files instead as those can be parsed the
same way as before, right?

thanks,

greg k-h

