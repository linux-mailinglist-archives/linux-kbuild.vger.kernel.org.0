Return-Path: <linux-kbuild+bounces-9417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE32C362F8
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 15:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A18E4F859F
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 14:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B4331329D;
	Wed,  5 Nov 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="Dnrkr9pg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10DC24397A;
	Wed,  5 Nov 2025 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354350; cv=pass; b=CEJGxM49SidWEOCPLU2oWmkz6uebBparCvuN74Z7zATYJAK5A0HrA28Mu/rGJAzx5s4nBHWrlZHWWuPQAFDf4Zdg8LhhIea69TzLR24UjAc/XSpvjV9KIyigJEr8clCocyL2sJpckuuxc28WV7IgnCS6jBkj9EDuLU3XyJAjPgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354350; c=relaxed/simple;
	bh=N/+AptUDxv4RzSiPU4SlqiAinbOqK98FjBLq6d33WFw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XF+8yQJh2j03qaCnra/5ecpuJ5FUnLVYlN8m9d2O6sDbWB0b7iXbZ0mUrbZDd7pJ/Zk+O+AitLBbbmsXfZ/vMvrz3yDVhf45LQ4T4CxzvDCo/GB9pGBQqCAshoNE+MyZwiZExMYb4EfSH6VzswOj8XijEzlWPr0H1V2d1lo34wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=Dnrkr9pg; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762354327; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h1c4izKjdZM14VrLx59UITU/r7SSEWDP87dd2zM1slOF0n2Gx599itT8K4COQ8ycNsr0Vqjj9rszFEy9tPdNcwDc7V8Ddq65DJYXcxk9PPVEpKfZIzfZo/CwWAaBnZmr0p59XFXB8LNmDZ7V08ioodaj1HKxOAk+o67Pubpa9XM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762354327; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tOoe7gYvP3slaG0QuqOo5ZEF9LAHVbJ54ULIoNkd7O0=; 
	b=iKbgNk4bXgpVX9fxJrnb1YHAbb0kXAVOFienxKLYCzQN5XCL/2mc/VNZUgdoEgUJOLirQMvhjt5qwpjrvS9By+gu60PfJdqVgVnKCpI7c1/IUVanHOhx1LF8o10tEEoHyReG0X8W5IFvPKYbbQTMSZvcP+6AKQvqefMntpgxXsU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762354327;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tOoe7gYvP3slaG0QuqOo5ZEF9LAHVbJ54ULIoNkd7O0=;
	b=Dnrkr9pgtFGXrIx5dAXVPo6GO/BcQd0BQJ12LIFqK7SwcB0MGCg4xxO+bjPri/+q
	qHIeZDwx7mwyEGfHSkCfJ+rfmec9dfKEuc/uk2+lifrprqKePkrRv+BcdD5Sd7O6eM6
	RhGBm/SQuQBmuRbEwL8TK1gx0+vGvY7LchAGvBvc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1762354324320452.12311002295587; Wed, 5 Nov 2025 06:52:04 -0800 (PST)
Date: Wed, 05 Nov 2025 22:52:04 +0800
From: Li Chen <me@linux.beauty>
To: "Peter Zijlstra" <peterz@infradead.org>
Cc: "Kees Cook" <kees@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-hardening" <linux-hardening@vger.kernel.org>,
	"linux-kbuild" <linux-kbuild@vger.kernel.org>,
	"Dan Williams" <dan.j.williams@intel.com>,
	"Bjorn Helgaas" <bhelgaas@google.com>
Message-ID: <19a5480e34c.81108d211707508.5372983468552631527@linux.beauty>
In-Reply-To: <20251105094904.GL3245006@noisy.programming.kicks-ass.net>
References: <20251105084733.3598704-1-me@linux.beauty>
 <20251105084733.3598704-5-me@linux.beauty>
 <19a53424397.26d1e5f01471331.8175059524177790573@linux.beauty> <20251105094904.GL3245006@noisy.programming.kicks-ass.net>
Subject: Re: [RFC PATCH 0/2] Add cleanup_plugin for detecting problematic
 cleanup patterns
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Peter,

 ---- On Wed, 05 Nov 2025 17:49:04 +0800  Peter Zijlstra <peterz@infradead.=
org> wrote ---=20
 > On Wed, Nov 05, 2025 at 05:04:02PM +0800, Li Chen wrote:
 > > +Peter, Dan, and Bjorn
 > >=20
 > > (My apologies for the oversight)
 > >=20
 > >  ---- On Wed, 05 Nov 2025 16:46:55 +0800  Li Chen <me@linux.beauty> wr=
ote ---=20
 > >  > From: Li Chen <chenl311@chinatelecom.cn>
 > >  >=20
 > >  > Hello,
 > >  >=20
 > >  > This patch series introduces a new GCC plugin called cleanup_plugin=
 that
 > >  > warns developers about problematic patterns when using variables wi=
th
 > >  > __attribute__((cleanup(...))). The plugin addresses concerns docume=
nted
 > >  > in include/linux/cleanup.h regarding resource leaks and interdepend=
ency
 > >  > issues.
 > >  >=20
 > >  > The cleanup attribute helpers (__free, DEFINE_FREE, etc.) are desig=
ned
 > >  > to automatically clean up resources when variables go out of scope,
 > >  > following LIFO (last in first out) ordering. However, certain patte=
rns
 > >  > can lead to subtle bugs:
 > >  >=20
 > >  > 1. Uninitialized cleanup variables: Variables declared with cleanup
 > >  >    attributes but not initialized can cause issues when cleanup fun=
ctions
 > >  >    are called on undefined values.
 > >  >=20
 > >  > 2. NULL-initialized cleanup variables: The "__free(...) =3D NULL" p=
attern
 > >  >    at function top can cause interdependency problems, especially w=
hen
 > >  >    combined with guards or multiple cleanup variables, as the clean=
up
 > >  >    may run in unexpected contexts.
 > >  >=20
 > >  > The plugin detects both of these problematic patterns and provides =
clear
 > >  > warnings to developers, helping prevent  incorrect cleanup ordering=
.
 > >  > Importantly, the plugin's warnings are not converted
 > >  > to errors by -Werror, allowing builds to continue while still alert=
ing
 > >  > developers to potential issues.
 > >  >=20
 > >  > The plugin is enabled by default as it provides valuable compile-ti=
me
 > >  > feedback without impacting build performance.
 >=20
 > IIRC GCC also allow dumb stuff like gotos into the scope of a cleanup
 > variable, where clang will fail the compile. Does this plugin also fix
 > this?
 >=20

I'm sorry, but I don't fully understand what you mean by "gotos into the=20
scope of a cleanup variable". Could you please provide a sample to illustra=
te this issue?
And I would try to fix it here if I can.

Regards,

Li=E2=80=8B


