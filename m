Return-Path: <linux-kbuild+bounces-4066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 640BD99AF3B
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 01:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09B371F228E9
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 23:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BE71E2018;
	Fri, 11 Oct 2024 23:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO5Eaf30"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1871E0B65;
	Fri, 11 Oct 2024 23:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728688491; cv=none; b=ZxNpjuiCNIZHrWpELUU89ZdQSxuYCtMS+ZoDekrpXJWdJvrCQoZU3O5cxz85zAxb/dhp7OZsZ6MpR45EFVSkc9ssc+71zTz/VZnfyTDbLBThpjKXv88H1JbR4KfgWYPj2R6XA9tSEbgptv8EC5P+d9G3PEhsd6zfpXFpY3OVxJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728688491; c=relaxed/simple;
	bh=8aM21mm0ReLA4xgspaUtnJ4pmSb0agOYKQSfa6vIj2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeU0syGVxq7uSa+X/xJjL1b0grLETeV41OLNwR5P+hVj0FnTZIWtKKkyReIrniWzwJaweqoSexRF/exPRFVaNdGV5wacPjc0b1JwbBSCHnpIqlOPjVyhPSwkNt3/2nFOETsSxxWZ7t7BmZvQ8/iIp3BF3goDBCMSEcWfMM/Hoas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RO5Eaf30; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8DA4C4CEC3;
	Fri, 11 Oct 2024 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728688491;
	bh=8aM21mm0ReLA4xgspaUtnJ4pmSb0agOYKQSfa6vIj2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RO5Eaf30eNKIh27U2AxWk2F6Lrkp27SS5N7gTQdVMb33jfEuuIRXO91Dv95W2+B+U
	 82u+Xjghbgy4j3yJWCnHMJOx8SaE8F2tnnVIgrxgJey9pJWhilMZDrpl++3SDjD4Qh
	 fCESHcyjjjezwCczWNL7cTHkTtwT4If0OlHZpNKGS2IaonX7KCLyE5+7ftmZ+qwR4k
	 BEfUbQM2ywbOHyQmGalIrCexVjRNQGkcsJqLfxQltr7OHA5xRoz/7yjptI9Q1WLFQd
	 +6Yesl12UeJrjV0G5hEFDVz7AhC3IjRLLfjDsYhJ9hPo7xbliyZ8mEyiReXgzmlxJ5
	 pwtsQZB2MpoMQ==
Date: Fri, 11 Oct 2024 16:14:49 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Sami Tolvanen <samitolvanen@google.com>, sedat.dilek@gmail.com,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] module: sign with sha512 by default to avoid
 build errors
Message-ID: <ZwmxaetqecTR5jAE@bombadil.infradead.org>
References: <42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info>
 <b32f1e42-d775-4538-ba36-9e9b906a34e3@leemhuis.info>
 <CA+icZUUgwJWY=PWO5fQPZbUc-q=LkdHXVe4+g-LnXmQfCA3N7Q@mail.gmail.com>
 <CA+icZUX9hrwFXA-6KVT+yZ=-NqyPB=LOKKWSf77-xb32totgHA@mail.gmail.com>
 <a5b3c47e-5f0f-4c0f-8ad9-4fb34d150548@leemhuis.info>
 <CABCJKudayCsPuowkUW7_JV_2HPNp5tf_py6jjDe6Ld7oMai9jg@mail.gmail.com>
 <c94590a5-4121-497b-8529-cbab2b01fe51@leemhuis.info>
 <e1037fe6-9cee-488f-8c9f-d5b4a763cb48@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1037fe6-9cee-488f-8c9f-d5b4a763cb48@leemhuis.info>

On Fri, Oct 11, 2024 at 02:00:47PM +0200, Thorsten Leemhuis wrote:
> On 11.10.24 12:27, Thorsten Leemhuis wrote:
> > On 10.10.24 17:52, Sami Tolvanen wrote:
> > Thx for your feedback!
> >> On Thu, Oct 10, 2024 at 1:57 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>> On 10.10.24 10:42, Sedat Dilek wrote:
> >>>> On Thu, Oct 10, 2024 at 10:29 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >>>>> On Thu, Oct 10, 2024 at 10:19 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>>>>> On 10.10.24 09:00, Thorsten Leemhuis wrote:
> >>
> >>> P.S.: Vegard Nossum mentioned in the fediverse that I could also solve
> >>> the problem the patch is about by adding "default MODULE_SIG_SHA512" to
> >>> the "choice" section; haven't tried that, but that sounds like a better
> >>> solution. Will likely give it a try, unless someone brings up unwanted
> >>> side effects this might cause.
> >>
> >> Yes, that would be a much better way to change the default. Overall,
> >> moving away from SHA-1 seems like a good idea and SHA-512 feels like a
> >> reasonable choice. Luis, do you see any issues with changing the
> >> default here?
> > 
> > So, how do I make such a default choice work without breaking the
> > current magic, which looks like this:
> > [...]
> 
> Ignore that, I was missing something obvious and got mislead by my
> brain, sorry for the noise. Will send a updated patch in a few days to
> give Luis and others a chance to raise objections reg. switching to SHA512.

The commmit log goes something like this:

Fix build by switching to sha512 by default.

The commit log should be imperative about the crap show issue without
the build considerations. Beat down the current default, call it names,
give URLs to back it up. You "noticed" this issue because the build
fails.

  Luis

