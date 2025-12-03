Return-Path: <linux-kbuild+bounces-9958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3ADC9E8E5
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 10:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A15E63A792F
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 09:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC28B2E9EC3;
	Wed,  3 Dec 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v0sbM61b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YBK4IXcl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v0sbM61b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YBK4IXcl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E202E9ECE
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Dec 2025 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754965; cv=none; b=AVuqFZQiARkb6Dsf9ZslhhllReyWUlQSwx56u8ua3Y5QwIIBP4nNDublYg9OMBEKvFNHWNwBXpZPzcMwhFkn1bo0wLZ/avOMlG4pX1laQ12fBdwDd5BHMoFZuqrMViq/ahdYIiCSUI+my9TYbRymHrBEiRfTBnt6UTxPAxAkHh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754965; c=relaxed/simple;
	bh=5bJLhwgaOOB+7MmQE1kCaxy6HNMhSVJjcOeSIxsJ1JE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTdyelm0phbIK/VTC7VX31GZDUwpEzu6DiYIRQH6I+xlcWulchftefp5UEqR30urB6fm7cwTnYmA8CyR9Pd2wmECQJU9c2/uGUmWVXh3DH/WxUiJCbvKr1nUoBXh4Jaz/78cDikKMxATHND6pldBSqKzL/3jpEqmr5ql8BehWyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v0sbM61b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YBK4IXcl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v0sbM61b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YBK4IXcl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3D9D2336E1;
	Wed,  3 Dec 2025 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764754961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyf3805CYxZp0YJgzZsk8ik4AtAhgcf2o9QEYLt9/dM=;
	b=v0sbM61b8YbsG5FuAgf1Tci6WvCgmqPjNfMnXAcnx4hBoUF7RxiLwfEWLoNYcl0NDDE/q0
	zcse8eBxlhREgoSLWP87isffMgnSeCR5O30rw00r51UHHO90INGxX8yvHzc3ccf9V0yDZj
	Ee5ULseJFistaZnD64UO0EqaRfOgkyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764754961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyf3805CYxZp0YJgzZsk8ik4AtAhgcf2o9QEYLt9/dM=;
	b=YBK4IXclr9/PKXf4DkKFh0o9coRY2epeRTuZHpqQsOYnhnyrBgH7H6fAGlzOLkYymYv+lx
	Qmzt6so1coooe6Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764754961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyf3805CYxZp0YJgzZsk8ik4AtAhgcf2o9QEYLt9/dM=;
	b=v0sbM61b8YbsG5FuAgf1Tci6WvCgmqPjNfMnXAcnx4hBoUF7RxiLwfEWLoNYcl0NDDE/q0
	zcse8eBxlhREgoSLWP87isffMgnSeCR5O30rw00r51UHHO90INGxX8yvHzc3ccf9V0yDZj
	Ee5ULseJFistaZnD64UO0EqaRfOgkyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764754961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyf3805CYxZp0YJgzZsk8ik4AtAhgcf2o9QEYLt9/dM=;
	b=YBK4IXclr9/PKXf4DkKFh0o9coRY2epeRTuZHpqQsOYnhnyrBgH7H6fAGlzOLkYymYv+lx
	Qmzt6so1coooe6Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF1DB3EA63;
	Wed,  3 Dec 2025 09:42:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 17WWKRAGMGn1GgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Dec 2025 09:42:40 +0000
Date: Wed, 03 Dec 2025 10:42:40 +0100
Message-ID: <871plbucj3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,	Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,	baojun.xu@ti.com,
	bo.liu@senarytech.com,	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,	kailang@realtek.com,
	linux-sound@vger.kernel.org,	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,	rf@opensource.cirrus.com,	Nicolas Schier
 <nsc@kernel.org>,	linux-kbuild@vger.kernel.org,	Masahiro Yamada
 <masahiroy@kernel.org>,	Nathan Chancellor <nathan@kernel.org>,
	miguel.ojeda.sandonis@gmail.com,	ojeda@kernel.org,	sam@gentoo.org,	Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,	Daniel Xu
 <dxu@dxuuu.xyz>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
In-Reply-To: <CAPnZJGAxrVJooo9CdgExd+uR+s=W9Na2dZzyjKZc=xYZv_kvmA@mail.gmail.com>
References: <87o6q8l68r.wl-tiwai@suse.de>
	<20251015145749.2572-1-safinaskar@gmail.com>
	<878qhckxc5.wl-tiwai@suse.de>
	<CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
	<875xcgkvnw.wl-tiwai@suse.de>
	<CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
	<CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
	<CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
	<87bjm78978.wl-tiwai@suse.de>
	<CAPnZJGAxrVJooo9CdgExd+uR+s=W9Na2dZzyjKZc=xYZv_kvmA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,dell.com,linux.intel.com,ti.com,senarytech.com,intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com,lists.linux.dev,kernel.org,gmail.com,gentoo.org,linutronix.de,dxuuu.xyz];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Tue, 02 Dec 2025 20:21:45 +0100,
Askar Safin wrote:
> 
> On Thu, Oct 16, 2025 at 12:52 PM Takashi Iwai <tiwai@suse.de> wrote:
> > Could you try to just enable CONFIG_SND_SOC_SOF_ALDERLAKE=m on top of
> > the broken config?  If my guess is right, this should make the audio
> > working again.
> 
> I did this. And the audio indeed works now.
> 
> Here are detailed logs:
> 
> - Here is Debian config for 6.18-rc7: [config-6.18-amd64]
> - I downloaded vanilla Linux 6.18-rc7 from kernel.org
> - I copied that Debian config (see above) as .config to Linux sources
> - I did "LOCALVERSION=-first make --silent -j32 < /dev/null" ("<
> /dev/null", because I don't want to answer any questions)
> - This is output: [attachment first-out]
> - Then I booted into it
> - Audio works
> - Here is config of this kernel: [config-6.18.0-rc7-first]
> - Here is "find /lib/modules/6.18.0-rc7-first": [find-6.18.0-rc7-first]
> - Here is alsa-info: [attachment alsa-info-first]
> - Here is lsmod: [attachment first-lsmod]
> - Then I "cd" into kernel source (note that ".config" remained since last time)
> - I typed "make localmodconfig < /dev/null"
> - Here is output: [attachment localmodconfig-out]
> - I did "LOCALVERSION=-second make --silent -j32"
> - This command didn't produce any output and didn't ask any questions
> - Then I booted into new kernel
> - Audio doesn't work
> - Here is config of this kernel: [config-6.18.0-rc7-second]
> - Here is "find /lib/modules/6.18.0-rc7-second": [find-6.18.0-rc7-second]
> - Here is alsa-info: [attachment alsa-info-second]
> - Here is lsmod: [attachment second-lsmod]
> - I enabled CONFIG_SND_SOC_SOF_ALDERLAKE=m
> - Then I booted into new kernel
> - Audio works (!!!)
> - Here is config: [config-6.18.0-rc7-third]
> - Here is alsa-info: [alsa-info-third]
> 
> I used default Debian initramfs generator during all these tests.

Then the problem is that snd-intel-dspcfg assigns
SND_INTEL_DSP_DRIVER_ANY because no corresponding entry matches to
your device without CONFIG_SND_SOC_SOF_ALDERLAKE.  This leads to let
AVS probing it, then failing.

A rather hackish fix would be something like below.  Instead of
dropping the SOF-only entries via ifdef, make them dumb entries
instead, so that the legacy driver are assigned for those when the
kconfigs aren't set.

The below patch is to the latest Linus tree, and for older kernels,
you might need to adjust it, but you see what to be done there.


thanks,

Takashi

-- 8< --
diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
index c401c0658421..818d8e502731 100644
--- a/sound/hda/core/intel-dsp-config.c
+++ b/sound/hda/core/intel-dsp-config.c
@@ -29,6 +29,9 @@ MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=lega
 #define FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE (FLAG_SOF_ONLY_IF_DMIC | \
 					    FLAG_SOF_ONLY_IF_SOUNDWIRE)
 
+/* Enable SOF only the given kconfig is enabled, otherwise fallback to legacy */
+#define FLAG_SOF_DEP(cfg)	(IS_ENABLED(cfg) ? FLAG_SOF : 0)
+
 struct config_entry {
 	u32 flags;
 	u16 device;
@@ -209,11 +212,13 @@ static const struct config_entry config_table[] = {
 		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
 		.codec_hid =  &essx_83x6,
 	},
+#endif
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_CANNONLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
 	},
-#endif
+
 
 /* Coffelake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
@@ -230,11 +235,12 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+#endif
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_COFFEELAKE) |\
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
 	},
-#endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE)
 /* Cometlake-LP */
@@ -269,10 +275,6 @@ static const struct config_entry config_table[] = {
 		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
 		.codec_hid =  &essx_83x6,
 	},
-	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
-	},
 /* Cometlake-H */
 	{
 		.flags = FLAG_SOF,
@@ -298,11 +300,17 @@ static const struct config_entry config_table[] = {
 		.device = PCI_DEVICE_ID_INTEL_HDA_CML_H,
 		.codec_hid =  &essx_83x6,
 	},
+#endif
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_COMETLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_CML_H,
 	},
-#endif
+	{
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_COMETLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
+	},
 
 /* Icelake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
@@ -324,11 +332,12 @@ static const struct config_entry config_table[] = {
 		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
 		.codec_hid =  &essx_83x6,
 	},
+#endif
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ICELAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
 	},
-#endif
 
 /* Jasper Lake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
@@ -356,11 +365,12 @@ static const struct config_entry config_table[] = {
 		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
 		.codec_hid =  &essx_83x6,
 	},
+#endif
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_JASPERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC,
 		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
 	},
-#endif
 
 /* Tigerlake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
@@ -388,137 +398,150 @@ static const struct config_entry config_table[] = {
 		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
 		.codec_hid =  &essx_83x6,
 	},
+#endif
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_TIGERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_TIGERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_H,
 	},
-#endif
 
 /* Elkhart Lake */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ELKHARTLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC,
 		.device = PCI_DEVICE_ID_INTEL_HDA_EHL_0,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ELKHARTLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC,
 		.device = PCI_DEVICE_ID_INTEL_HDA_EHL_3,
 	},
-#endif
 
 /* Alder Lake / Raptor Lake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
+		.codec_hid =  &essx_83x6,
+	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
+		.codec_hid =  &essx_83x6,
+	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+#endif
+	{
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_S,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_S,
 	},
 	{
-		.flags = FLAG_SOF,
-		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-	{
-		.flags = FLAG_SOF,
-		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
-		.codec_hid =  &essx_83x6,
-	},
-	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PX,
 	},
 	{
-		.flags = FLAG_SOF,
-		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
-		.codec_hid =  &essx_83x6,
-	},
-	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_M,
 	},
 	{
-		.flags = FLAG_SOF,
-		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
 	},
 	{
-		.flags = FLAG_SOF,
-		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
 	},
 	{
-		.flags = FLAG_SOF,
-		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_ALDERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_PX,
 	},
-#endif
 
 /* Meteor Lake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_METEORLAKE)
@@ -536,55 +559,56 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+#endif
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_METEORLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_MTL,
 	},
 	/* ArrowLake-S */
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_METEORLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ARL_S,
 	},
 	/* ArrowLake */
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_METEORLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ARL,
 	},
-#endif
 
 /* Lunar Lake */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_LUNARLAKE)
 	/* Lunarlake-P */
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_LUNARLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_LNL_P,
 	},
-#endif
 
 	/* Panther Lake, Wildcat Lake */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_PANTHERLAKE)
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_PANTHERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_PTL,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_PANTHERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_PTL_H,
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_PANTHERLAKE) | \
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_WCL,
 	},
 
-#endif
-
 	/* Nova Lake */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_NOVALAKE)
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF_DEP(CONFIG_SND_SOC_SOF_NOVALAKE) |\
+			FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_NVL_S,
 	},
-#endif
 
 };
 

