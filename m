Return-Path: <linux-kbuild+bounces-4880-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7669D9D5A
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 19:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE023B26C93
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 18:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C3A1DDA3A;
	Tue, 26 Nov 2024 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWpgElh7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E4B1DD884;
	Tue, 26 Nov 2024 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732645592; cv=none; b=L0SJJpkVCgDUzhvS34zM7Mjy3TVgB9V5OUv86zI1kkzRaKXxnwzXyToVxosiAsE6nEEY1nRiBxUq5MRFjTROJ+s4Xv9SRGbCjPhhopBVkXbLfYUrPq4LtGIQJjuEI+uUOPIq6UxyBctE2EZMbPU4auHQ/hO2/Vrid7s6SDqnXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732645592; c=relaxed/simple;
	bh=qoJkbvqNkeNnnpFr+zRZuQQt2IMeASHPugu5yJtczis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXNejJbcvEMBvbACBokZ37OqOrJKslc7G73wYt+2TuA+c5qaaQEQBwi2492hbk8Ln3Shn4LnKm2Mr8oRB3EXfugoXZAHxY26KIzqtnhE+aTozyBbDmms93gI753WZtkFZZ59J+tcXJqJB8IgvUsF/3YVvXgaEI/btZYMbhOuSW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWpgElh7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90AAC4CECF;
	Tue, 26 Nov 2024 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732645592;
	bh=qoJkbvqNkeNnnpFr+zRZuQQt2IMeASHPugu5yJtczis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWpgElh7W4xszVVCninZalei+iyG8xzoHKWyF66dpFpcepraRbnl2rq3cYKG1vaeG
	 HBTkk1NaF9JDAK4Lz8KVHVtEkMh0kkiCzPu5vtOl0VKA4ECSlY5TTHucvyWvy8Im0q
	 20AZDF1G+TG1UGZIRYvxgIA0CmHC+EgDNZPdfgoJWMq4papTzxT6avi4QmEYI8OrIn
	 cK9gmyZNJY7i72tjs1bV5EVF/E8AnFQ6AZv2EoffkN8D1Lh9aug4n0D+DIBSBCEqTs
	 ngr09Apxy34UAkBEt5b5zktKVkINBtoL2CJZz+LhUwtQPazhjAxSVjcPYzRaaRjsC5
	 HAW7zTWW+59fA==
Date: Tue, 26 Nov 2024 10:26:30 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Miroslav Benes <mbenes@suse.cz>,
	Asahi Linux <asahi@lists.linux.dev>,
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
Message-ID: <Z0YS1hVWuozpN4Ln@bombadil.infradead.org>
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-21-samitolvanen@google.com>
 <Z0UIdmDHYQtUTR1i@bombadil.infradead.org>
 <CAK7LNATK9rSm4AUSneq=aYbADatPL=1eUXuYRChX+WU+zNTyKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATK9rSm4AUSneq=aYbADatPL=1eUXuYRChX+WU+zNTyKw@mail.gmail.com>

On Tue, Nov 26, 2024 at 12:50:48PM +0900, Masahiro Yamada wrote:
> On Tue, Nov 26, 2024 at 8:30 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Thu, Nov 21, 2024 at 08:42:22PM +0000, Sami Tolvanen wrote:
> > > Add a basic DWARF parser, which uses libdw to traverse the debugging
> > > information in an object file and looks for functions and variables.
> > > In follow-up patches, this will be expanded to produce symbol versions
> > > for CONFIG_MODVERSIONS from DWARF.
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > > ---
> > >  kernel/module/Kconfig                 |   8 ++
> > >  scripts/Makefile                      |   1 +
> > >  scripts/gendwarfksyms/.gitignore      |   2 +
> >
> > This doesn't add scripts/gendwarfksyms to MAINTAINERS
> > but then again   scripts/genksyms/ is not there either
> > but it does got to Masahiro.
> 
> scripts/genksyms/ is a very old tool with no maintainer.
> 
> It defaults to the maintainer of the scripts/ directory (i.e. me)
> 
> > Masahiro, should we just add both to KERNEL BUILD and add
> > Sami as a Reviewer to help with gendwarfksyms?
> 
> I think it is better to have a separate entry for
> 
> F:  scripts/gendwarfksyms/
> 
> with Sami as the maintainer.

OK do you want this and the extended modversions to go through your tree
or modules tree?

  Luis

