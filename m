Return-Path: <linux-kbuild+bounces-2209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6090DC0A
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 20:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 786341C231AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 18:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70F215ECE3;
	Tue, 18 Jun 2024 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XxliiDUX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F95646426;
	Tue, 18 Jun 2024 18:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737060; cv=none; b=nXDCJRWHD5bZE8huEmZ2cuxdk5qcOwiUa01R0iLka4L6ndX0hGLvUcagHCiwGWjkpjERSJwsrjG1rNXybiqcmuB9VXjQARXLs83yB6+N8eTl/4gwDOq1YZPjCpCYxJEsqLKoiUqCEnfh1YiaWw8copFl2hfH9s7xIQpdX5oJJDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737060; c=relaxed/simple;
	bh=V2M0mghClHrj2M1W92vMubTxRSy/b/LNfUMvZytS9g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6o6xBINEnmCiDaaqBHSExzdH7iQe+1+Auv1be/eMz3pnTi3lTwX5FaNy+dA7JP9QnqfOta8sp/ft54s2q3r2l2oYKqjbalf0eA1qycarskO2DRyERUITPG0+7C0lj8nlRlhfWLVXYoNEJxXVNvjuqhtK7gYpKwbP1HTwnZGoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XxliiDUX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fP0p/3mvmbIRDHw9DLHTHRUnXrWqbRc3mEb0WsGLk6g=; b=XxliiDUXXk8a92ZH7bFiybmuTC
	mlqS4R7gFzQlaxVDDwHUR5TvgfnJMNJP+MJ9dPfWvLya4h5dbhQqc5mZRN0Wie2xs4TVnQ+FvMORI
	gNqPgYUpbV1pcs8K+PQaARgb2fteZTjIsj0K5swYr68rar5bhGQ467HztOvYlpwagfh/fBOCSAZGB
	89DxiblHTn3Liix0bWKnBEIHWp4O9HA8GQcqQfXgwV10zdFltJrJsHlfRyKlCv1Em0G5TcctwcWSb
	yhetDHTS0/I+dM2CNyvrYvN26lai3igslpFh7S0CbZZeCRfaYGYRz+qWS3w74RaGBxbB/9yn3szLc
	flHzLEDA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJe1S-0000000GHaO-2ejC;
	Tue, 18 Jun 2024 18:57:38 +0000
Date: Tue, 18 Jun 2024 11:57:38 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Nick Alcock <nick.alcock@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jiri Olsa <olsajiri@gmail.com>,
	Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v4 2/3] kbuild, kconfig: generate offset range data for
 builtin modules
Message-ID: <ZnHYooN7o2JEgsWA@bombadil.infradead.org>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
 <20240614171428.968174-3-kris.van.hees@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614171428.968174-3-kris.van.hees@oracle.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Fri, Jun 14, 2024 at 01:14:27PM -0400, Kris Van Hees wrote:
> The offset range data for builtin modules is generated using:
>  - modules.builtin: associates object files with module names
>  - vmlinux.map: provides load order of sections and offset of first member
>     per section
>  - vmlinux.o.map: provides offset of object file content per section
>  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME

What tests do we have to ensure this is working correctly and not
spewing out lies? What proactive mechanisms do we have to verify the
semantics won't change, or to warn at build time that this awk script
will break upon new changes? Is this just best effort? Is that good
enough? Why?

  Luis

