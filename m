Return-Path: <linux-kbuild+bounces-4996-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F59E483A
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 23:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAACA1880638
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 22:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1F71C0DF0;
	Wed,  4 Dec 2024 22:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pn+YTKmx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED971B3955;
	Wed,  4 Dec 2024 22:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733353139; cv=none; b=G3+PJV+7QzZCEh13hOfVGb/arRzopMNmEOOCwcZ6o+GBUyoTAWIg2MG6LPzeDrJtp2XgQzQDEKFT7P4hp6Df5xr2U+GUDsjxkxxRoDV/hz4OfjziF2ErmKTZjP0WhR9KpbwejBvoRAntfJGJpJYU0AUndbFil5TstkiIX27EHAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733353139; c=relaxed/simple;
	bh=UrcsHStCvsfWVXs4AWEqG/wsIRBlLFof+L5sEHT0UaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkoK8CistgvfW2xpaz64R2mSKlHenHXLZ6egLO5QY+nFjofXZw0gRTS+FLIF4lLgD3cE1GDzJhZapfUcnbuftfDflNO0+250VI1isEgUeNsbkLxJet7VhYA4mbpygCjeFZQHSYqwULHNWbC45n7FWQ4FG8o41vUg5mL1BhjoMoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pn+YTKmx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA87C4CECD;
	Wed,  4 Dec 2024 22:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733353139;
	bh=UrcsHStCvsfWVXs4AWEqG/wsIRBlLFof+L5sEHT0UaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pn+YTKmxRDdzeW3GRZ5HeMCHzAekByuMYOc1rY6MHfLvZ7ukj3N3e3tU7O+n0RTL4
	 ON8oZOTa0uMMsEcE3fBFcUUnAvk7uPSkq8cjU8tLshr191KkW79HBw4qyHDHvcuvFE
	 3SqNoGZ//SkSCT/D/oVPqJNHS9h6rEmR5PBydC6DrViyhy9cOEheXrkZUVbbUZghi8
	 ChKPS7T2iaGqapN+I3U6H+bfEbc9XcvAm/2eKZCHytP12fNIhOVgQu+zsz/3rFLqa/
	 Q3OOdAqiLsaD0SsVumypFrfhGXUblh2+d/xt8t2xaOyzJGGfJ3s0QNx5xGZBWdKkOO
	 /iRjE6BC7ihwA==
Date: Wed, 4 Dec 2024 14:58:57 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de,
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de,
	masahiroy@kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v6 00/11] kbuild, kconfig: Add support for conflict
 resolution
Message-ID: <Z1DesQ8fYQBDSvKa@bombadil.infradead.org>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028034949.95322-1-ole0811sch@gmail.com>

On Mon, Oct 28, 2024 at 04:49:38AM +0100, Ole Schuerks wrote:
> Hi,
> 
> Configuring a kernel requires a forward enabling approach where one enables
> each option one needs at a time. If one enables an option that selects
> other options, these options are no longer de-selectable by design.
> Likewise, if one has enabled an option which creates a conflict with a
> secondary option one wishes to enable, one cannot easily enable that
> secondary option, unless one is willing to spend time analyzing the
> dependencies that led to this conflict. Sometimes, these conflicts are not
> easy to understand [0,1].

This paragraph is a bit too researchy, move it to:

https://kernelnewbies.org/KernelProjects/kconfig-sat

> This patch series (for linux-next) provides support to enable users to
> express their desired target configuration and display possible resolutions
> to their conflicts. This support is provided within xconfig.

This should be your next cover letter's first paragraph.

> Conflict resolution is provided by translating kconfig's configuration
> option tree to a propositional formula, and then allowing our resolution
> algorithm, which uses a SAT solver (picosat, implemented in C) calculate
> the possible fixes for an expressed target kernel configuration.

Just say something like:

Conflict resolution is provided by translating kconfig's configuration
option tree to a propositional formula and allowing our resolution
algorithm and picosat to calculate the possible fixes for an expressed
target kernel configuration. Picosat is the smallest and most robust C
SAT solver we could find which is also GPL compatible. <insert
information about the efforts done to also provide debian packages
for picosat and briefly mention how picosat is used as library>.

> New UI extensions are made to xconfig with panes and buttons to allow users
> to express new desired target options, calculate fixes, and apply any of
> found solutions.

This can be the third paragraph.

> We created a separate test infrastructure that we used to validate the
> correctness of the suggestions made. It shows that our resolution algorithm
> resolves around 95% of the conflicts. We plan to incorporate this with a
> later patch series.
> 
> We envision that our translation of the kconfig option tree into a
> propositional formula could potentially also later be repurposed to address
> other problems. An example is checking the consistency between the use of
> ifdefs and logic expressed in kconfig files. We suspect that this could,
> for example, help avoid invalid kconfig configurations and help with ifdef
> maintenance.

I think these two paragraphs are very forward lookjng and can be just
put into the wiki for now.

> You can see a YouTube video demonstrating this work [2]. This effort is
> part of the kernelnewbies Kconfig-SAT project [3], the approach and effort
> is also explained in detail in our paper [4]. The results from the
> evaluation have significantly improved since then: Around 80 % of the
> conflicts could be resolved, and 99.9 % of the generated fixes resolved the
> conflict. It is also our attempt at contributing back to the kernel
> community, whose configurator researchers studied a lot.

I think this is a nice final paragraph summary for the research to
include.
 
> Patches applicable to next-20241025.
> 
> [0] https://gsd.uwaterloo.ca/sites/default/files/vamos12-survey.pdf
> [1] https://www.linux-magazine.com/Issues/2021/244/Kconfig-Deep-Dive
> [2] https://www.youtube.com/watch?v=vn2JgK_PTbc
> [3] https://kernelnewbies.org/KernelProjects/kconfig-sat
> [4] http://www.cse.chalmers.se/~bergert/paper/2021-icseseip-configfix.pdf
> 
> Thanks from the team! (and thanks to Luis Chamberlain for guiding us here)

Sure.

> Co-developed-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>

This all can be removed, patch tags have no meaning for cover letters.

> Changelog v6:
> * remove script for manually installing PicoSAT
> * adapt documentation and help text in the GUI accordingly
> * convert Qt signal/slot connects to new style

It is wonderful you are keeping tabs of the changes on the cover letter,
keep it up!

  Luis

