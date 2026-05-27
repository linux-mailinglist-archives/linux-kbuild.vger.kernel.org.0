Return-Path: <linux-kbuild+bounces-13375-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBwjLgFHF2qS/QcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13375-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 21:33:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C8D5E989C
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 21:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F304B305BEB8
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 19:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5056037B014;
	Wed, 27 May 2026 19:32:37 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE9E279903;
	Wed, 27 May 2026 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779910357; cv=none; b=bo6DpxpdY2FkekuuueCvtoUTZIe68isuw/D7aYK1j+aF7SiLANjyWdEjVUubN8lGABpTQ/zAM6k5h3X+Mmy6wCEHJHTiAhZNamv5qBtZ76p5u/iW1EOq0CYQFJf8rgCMWdOngvTBxv8vvEM3aQKHghxuCZditZV+GMKNa28MZ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779910357; c=relaxed/simple;
	bh=XrV6pvz7EmVN8mpKSGyJZ16fe1BTF9LlQZAPlUsFwqc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrVKdUW7/CW4fuPhIpd6eUNTLUnS2kaxr9GVdF6sxL9z9phci8cDzUFoQPhE8PrG4ok0b8AMhtlJDgs2hxb+Nbp4j+J3aOhRDUPuW3KF3DaJf+1St8wrJJ2ukAroq4Nscf2g/0rTW07+iOKogTRTchOljCl7ybwvNsDtbJPQe30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wSJzL-000000003hp-0GZn;
	Wed, 27 May 2026 19:32:23 +0000
Date: Wed, 27 May 2026 20:32:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Sterba <dsterba@suse.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Filipe Manana <fdmanana@suse.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Chih-Kang Chang <gary.chang@realtek.com>,
	David Lechner <dlechner@baylibre.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>, Boris Burkov <boris@bur.io>,
	Blake Jones <blakejones@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 2/4] scripts/jobserver-exec: propagate child exit status
Message-ID: <660368ca16e2d3845577a9fd157d2f37f0e09e85.1779908995.git.daniel@makrotopia.org>
References: <cover.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779908995.git.daniel@makrotopia.org>
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13375-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[makrotopia.org];
	FREEMAIL_TO(0.00)[kernel.org,realtek.com,linux.intel.com,suse.com,linaro.org,quicinc.com,oss.qualcomm.com,gmail.com,suse.de,amd.com,baylibre.com,makrotopia.org,garyguo.net,weissschuh.net,intel.com,roeck-us.net,wp.pl,bur.io,google.com,lwn.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,makrotopia.org:mid,makrotopia.org:email]
X-Rspamd-Queue-Id: 30C8D5E989C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

main() called JobserverExec().run() and discarded its return value,
then the script exited with the implicit status 0. As a result, any
Makefile that wired a build step through jobserver-exec saw the step
silently succeed even when the wrapped command had failed.

Two in-tree callers were affected:

  Documentation/devicetree/bindings/Makefile
    cmd_chk_style runs a python checker via jobserver-exec and uses
    "&& touch $@ || true" so failures leave the stamp file untouched
    and the next make rerun reports them again. The swallowed exit
    code made the stamp file get created even on failure, caching the
    failed run and hiding the reported issues until the inputs change.

  scripts/Makefile.vmlinux_o
    cmd_gen_initcalls_lds runs scripts/generate_initcall_order.pl via
    jobserver-exec; a perl failure was masked by the wrapper.

Return the subprocess exit code from main() and pass it to sys.exit()
so the wrapped command's status reaches make.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: new patch; prereq for chk_style in 3/4 so style failures
    leave the stamp file untouched instead of being cached

 scripts/jobserver-exec | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/jobserver-exec b/scripts/jobserver-exec
index 758e947a6fb9..21b319e6c9a5 100755
--- a/scripts/jobserver-exec
+++ b/scripts/jobserver-exec
@@ -28,8 +28,8 @@ def main():
         sys.exit("usage: " + name +" command [args ...]\n" + __doc__)
 
     with JobserverExec() as jobserver:
-        jobserver.run(sys.argv[1:])
+        return jobserver.run(sys.argv[1:])
 
 
 if __name__ == "__main__":
-    main()
+    sys.exit(main())
-- 
2.54.0

