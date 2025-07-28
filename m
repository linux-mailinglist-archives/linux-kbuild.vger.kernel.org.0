Return-Path: <linux-kbuild+bounces-8220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596E2B13416
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 07:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1D9B3B8096
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 05:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7973217733;
	Mon, 28 Jul 2025 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Sfkq+PGU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1D460DCF;
	Mon, 28 Jul 2025 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753680049; cv=none; b=nyw+eBmML1WtdgTisfgEr6sYu6Wo6NbJQoteRgieem1RBhS/xrWs1jGPHMq14Lz6U5XJQtWazz7BkoxWYEd/agfkXN4Zcz8+udGC1wLvA644gV6JHS944qa96lk2EKEItpktwC3t4Un/kmJjflo/nDkFv+zHz3KmK9WoGdhYPUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753680049; c=relaxed/simple;
	bh=v+I/yE5AAfGPdFCg6YeOFNThMNSTK2a5A3m+QZPkj7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSp/sPDfw6RC2WXfw1rn0bfLDrda82BGKFFoBz+0JTBoO67/CJo4TftKr/crAJjJzTt8WfioGMio0yjUo14E0CouvGzjSjSlMn8vRJ2Hal40GdINOshEiBDdzen9Qw67UWbws5MUgc7fHui9HSYNppkhryw1pxZbYU2f0XdEmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Sfkq+PGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFACDC4CEE7;
	Mon, 28 Jul 2025 05:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753680049;
	bh=v+I/yE5AAfGPdFCg6YeOFNThMNSTK2a5A3m+QZPkj7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sfkq+PGUiEYeGZ/tsCO5vEn4Yg0s9DPQ8gW+ppKjVnwqQEOANEeD2XcP/vjjD5yVH
	 oxFvOPadZadJVQnjXOz/6JLt1/XdDCXp101ngeBplUcfZUZzgIKKZqKIbApxTObDCD
	 tyt5LTnYY8QncfdY1z1EGNVC6+ygLTMYALvb71II=
Date: Mon, 28 Jul 2025 07:20:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: masahiroy@kernel.org, nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in
 inputbox.c
Message-ID: <2025072809-pursuit-hardwired-d894@gregkh>
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
 <2025072842-require-smokeless-f98f@gregkh>
 <CAO9wTFjuSch0Cc0yXV=PR9vkk+66i_4PSanrPqKYyXXhWjO-QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9wTFjuSch0Cc0yXV=PR9vkk+66i_4PSanrPqKYyXXhWjO-QA@mail.gmail.com>

On Mon, Jul 28, 2025 at 10:18:35AM +0530, Suchit K wrote:
> On Mon, 28 Jul 2025 at 09:59, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Jul 27, 2025 at 10:14:33PM +0530, Suchit Karunakaran wrote:
> > > strcpy() performs no bounds checking and can lead to buffer overflows if
> > > the input string exceeds the destination buffer size. This patch replaces
> > > it with strncpy(), and null terminates the input string.
> > >
> > > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > > ---
> > >  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> > > index 3c6e24b20f5b..5e4a131724f2 100644
> > > --- a/scripts/kconfig/lxdialog/inputbox.c
> > > +++ b/scripts/kconfig/lxdialog/inputbox.c
> > > @@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
> > >
> > >       if (!init)
> > >               instr[0] = '\0';
> > > -     else
> > > -             strcpy(instr, init);
> > > +     else {
> > > +             strncpy(instr, init, sizeof(dialog_input_result) - 1);
> > > +             instr[sizeof(dialog_input_result) - 1] = '\0';
> >
> > As this is a userspace tool, why is this change needed at all?  How can
> > this overflow and if it does, what happens?
> >
> 
> Hi Greg. The primary motivation for this patch was the deprecation of
> strcpy(). Additionally, I believed there was a possibility of a buffer
> overflow if the initial string accidentally exceeded the length of
> instr, although the chances might be low.

Is strcpy() being deprecated in userspace?  I think it's a core part of
the C language specification :)

Again, how can that buffer be "too large"?

thanks,

greg k-h

