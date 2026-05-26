Return-Path: <linux-kbuild+bounces-13347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OQtBjgLFmrYhAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13347-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 23:06:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 664085DC971
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 23:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BBD4301477A
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 21:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC2E3C1F3A;
	Tue, 26 May 2026 21:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gAE1URb8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fzki7azI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB473C1411;
	Tue, 26 May 2026 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779829556; cv=none; b=mdpxD2oNSKptdDu7YtA67FNT0Ti/6YDy8GAruYxAYRjtW896oGyF8lshtj5QTq1NjBmk52bWm5axXUgTCyTYnFgC6S3ukOd5XaJFLVs3eRUE4sYxZl4urSyBEiFnwHryAZ6SUFN0BgJd+ufgWa7sQS+VbOgz8Hduy6QmCGKIphQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779829556; c=relaxed/simple;
	bh=zzzGG/Se+N06e8rmhJoLxENObcYbzWkFB5ZmImuup1Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=a2sogZhccsVoTCGdlQXgnBmvRSZsoKW9OObp7M02jgzmCom/LrNUC6nKlXaZz6L41oZ6SFvYkeIp4UGfdq9OPBjJMZ1qqz/PlmbOJpvdq9rMHCS9mJoVkIgaKI/42wyIh1jKd98FR2qbje+M1GXksCS4ptAK26kZhmV2LxA5dDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gAE1URb8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Fzki7azI; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 9A12DEC01E3;
	Tue, 26 May 2026 17:05:53 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 26 May 2026 17:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779829553;
	 x=1779915953; bh=yFTLa9hUaut5h/+JDIWX7TMhULTIiq3WOIkQ02eoHnI=; b=
	gAE1URb87bH766/OiIUvvQvCYcbSUmvZhvm7YA9EQ7YdfUuAoJq+g2xLqU2PUHzL
	+pu8HJRsAqAZ27amJPOfAeDJhKJPQhTyvPsttyjXkf09GiArwCpnB/2vcfjOFmow
	KzHbjg6422B1t9ANsjtt6yTys+H2Cg1O4MK5lsH/daLeRdwCQVkFIuUfm8D9Bie+
	luEGGrmVcWxy9TKd0rDiBVqI7eX67qejwwYnjv14sDtlQG3W/Pi3Hvv17U6M1fJX
	DAMGhSjPwwwe2RqsnmY/xEYzk3bWLiXYg98WX9UFKCfl9KW3Y8nAJloxvhFshied
	+fY+vgzEuMrfAdmoRnFjiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779829553; x=
	1779915953; bh=yFTLa9hUaut5h/+JDIWX7TMhULTIiq3WOIkQ02eoHnI=; b=F
	zki7azIutAMBngdnMFeDQ8DtMkZEHlJ5DmE4IpxrJVnQI1/Xaf4i2+4C+9RVrqT9
	hqilL0lP8qQQTZtZxP8mc5XgCuuH3P+YXWvODTpokZBoPsba5QiDdkMB+bn/N/Qn
	IkjJFlfXrvN9JKV7lUmJp/ScCaCe3HzfsFf17gGJEE3sVgnB0IfPMmgOGU/usIa8
	8x9/9PMRIahzmhjGU7nPtulsxG5U5OdVeGuYGGUFZHpoyIOFR4n9+1gY57z3oULB
	Z6go1PLLEjOVfbQM/jJSteXjqai/96yj72h6HTfUC1MMzmIbFP9e/v7sAkKuQe80
	zSUUuKjEiCwAEToTDWD1w==
X-ME-Sender: <xms:MAsWarbf7j3zT1d9vpGXLMpyiqO4t0nHsphcmtKH5jZMrGLiVf2XGQ>
    <xme:MAsWalOYCefM9BRnsJ-7l7jKn2rGaWsOmjDSB5XCKYxYQUTBtg1YKphwnqd0At5r6
    qnk_mh-GjLp4CnxyL4g7kGVPMlbcETpoETjv1cM3TUJPKooWHcYoA_d>
X-ME-Proxy-Cause: dmFkZTEsmtgaAJEULX6LdCIDflApZzC46KdmkgRG3XUX87dZa/xwwB5HeNo5BxhZ6pI/Y0
    phNZ8ox6ak64Fil/Ft83UbMkpmMETpAEKSH8L88kw63SESbyOvNNYIuZy+ocRTK9w8iVyU
    3HP1iJ5t2VbqHne5xRAl6IUnjdJmGdXoMcl1+YEXiB55nPx7Ko71fd1izhhAShLqYNnLW0
    k2QMdi4kCDLPS3kAtZsSDAC4SUSLl9QSFJhtId1a+w+K1ojph8Lz+CYZlBFL5kSjq2ZxP2
    oKgwAbIRDeIpnZSo94XTJs/J5rh0y+FEKUD70XxkdLKPmQKfJ2HDEuiWwo1zhAdTrkcXWe
    ZbkOH/O7EkT49MDzX8LMtK1W0feKnGtGOxneOAK9CLHXTQcJOLdmcLsslJvoY+mWAnd2v3
    bQwNl97KYqAL3WAPWj3TWnX7XRPSEfLN2T88eAElp/I16oMsdRSPI4hJSzkS1azENhsAtb
    ytvHHkOgl+1pQ6AIOOXw5kCBm5tKRsZv2HYJI0tTpKtpczs/1g5twZHeSM+hevUBXzBsn7
    qFQ56rVziesCjEBxpSgtqTpeNBhwjcZQKGVFaAUCyyeuaBawdx/YIKyHp48guFcbWKqZ73
    /asiwGfd00/AbLiWdkC6h3Xw1Q8XgqdC9KxM4nX1zjFGv0Eo9Ikpu/1vYjCA
X-ME-Proxy: <xmx:MAsWat_svf6niJmw-zj3MlbTtfe4C-Rp-4YxeAaptmyb751WuJGRVA>
    <xmx:MAsWarGAqKofOhhjetDBBPqyRVupyp1ddH0fIObIowpA_Gd_HXdAlA>
    <xmx:MAsWajgPif5xt6neToE7pCUNPvhPiGcqTrVMrobG9cGuCJwCHv-XHg>
    <xmx:MAsWag9J4Fc7O0UkjWGdzZrkaGwhTjQt6UdYH2JleKIPraHlJsGb8w>
    <xmx:MQsWai0xTzZouz9IxTuRcHH-6ZCrN7aMhjOocCAg-Gee39uoNy_cSqHH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B12EC182007A; Tue, 26 May 2026 17:05:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-HAwpsKkos7
Date: Tue, 26 May 2026 23:03:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Lobakin" <aleksander.lobakin@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 linux-s390@vger.kernel.org, "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Christian Marangi" <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org,
 "Steven Rostedt" <rostedt@goodmis.org>
Message-Id: <8e50449f-66f0-4e85-aefa-7016697fe722@app.fastmail.com>
In-Reply-To: <b5e15330-ed64-4f31-bea2-bb877a24c1ce@intel.com>
References: <20260526101851.2495110-1-arnd@kernel.org>
 <b5e15330-ed64-4f31-bea2-bb877a24c1ce@intel.com>
Subject: Re: [PATCH] err.h: use __always_inline on all error pointer helpers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13347-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,kernel.org,linux.ibm.com,linux.intel.com,gmail.com,goodmis.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arndb.de:email,arndb.de:dkim]
X-Rspamd-Queue-Id: 664085DC971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026, at 17:01, Alexander Lobakin wrote:
> From: Arnd Bergmann <arnd@kernel.org>
> Date: Tue, 26 May 2026 12:18:41 +0200
>
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> While testing randconfig builds on s390, I came across a
>> link failure with CONFIG_DMA_SHARED_BUFFER disabled:
>> 
>> ERROR: modpost: "dma_buf_put" [drivers/iommu/iommufd/iommufd.ko] undefined!
>> 
>> The problem here is that IS_ERR() is not inlined and dead code elimination
>> fails as a consequence.
>> 
>> The err.h helpers all turn into a trivial assignment ot a bit mask
>> and should never result in a function call, so force them to always be
>> inline. This should generally result in better object code aside from
>> avoiding the link failure above.
>
> bloat-o-meter would be nice to see but optional, it's obvious to me that
> these helpers should always get inlined.
>
> Not sure why compilers sometimes decide to uninline a couple
> instructions (feels like there's sorta dumb logic "oh it's used more
> than X times -- uninline no matter what").

I've run bloat-o-meter on the vmlinux.o file now and indeed it shows
what is going on: the configuration that triggered this has
CONFIG_PROFILE_ANNOTATED_BRANCHES, which turns the unlikely()
bit in IS_ERR() into two extra function calls, so my patch does
end up adding a bit of bloat (see output below):

   text	   data	    bss	    dec	    hex	filename
20159943	5630468	16199728	41990139	280b7fb	build/s390/0xCED6EE04_defconfig/vmlinux-old.o
20217607	5630404	16199728	42047739	28198fb	build/s390/0xCED6EE04_defconfig/vmlinux-new.o

Without CONFIG_PROFILE_ANNOTATED_BRANCHES, the changes are
very small, with around 100 functions growing or shrinking
by a few bytes.

I don't think we care much about the size increase when that
option is enabled, but I do wonder what behavior makes more
sense regarding the annotation for every single IS_ERR(). 
Does it make sense to have every instance get its own counter,
or would it make sense to actually try to reduce these
when profiling the annotations?

       Arnd

----
add/remove: 7/8 grow/shrink: 1503/48 up/down: 87810/-28892 (58918)
Function                                     old     new   delta
ext4_fill_super                            17578   18080    +502
ext4_ext_map_blocks                         8550    9004    +454
is_of_node                                   724    1174    +450
ext4_fc_replay                              5408    5782    +374
__s390x_sys_open_by_handle_at               2596    2968    +372
fwnode_property_get_reference_args           390     750    +360
power_supply_get_battery_info               3228    3586    +358
of_parse_phandle_with_args_map              1504    1856    +352
class_fd_prepare_destructor                  776    1128    +352
itcw_init                                   1190    1534    +344
ntfs_fill_super                             8172    8508    +336
fwnode_handle_put                            976    1312    +336
_of_add_table_indexed                       4360    4696    +336
alg_setsockopt                              1204    1518    +314
gpiod_find_and_request                      1284    1594    +310
ext4_flex_group_add                        11484   11794    +310
ext4_mb_load_buddy_gfp                      1790    2096    +306
fwnode_property_read_string_array            306     604    +298
path_openat                                 5138    5432    +294
fwnode_property_read_int_array               314     604    +290
squashfs_fill_super                         3848    4134    +286
__s390x_sys_memfd_secret                    1130    1404    +274
__s390x_sys_statmount                       3664    3930    +266
x509_key_preparse                           1156    1398    +242
mbox_request_channel                         730     964    +234
futex_hash_allocate                         1624    1858    +234
do_signalfd4                                1228    1462    +234
device_get_dma_attr                          356     590    +234
__s390x_sys_timerfd_create                  1134    1368    +234
dev_pm_opp_adjust_voltage                    542     770    +228
_opp_set_availability                        468     696    +228
rtm_new_nexthop                            12600   12826    +226
load_module                                11888   12114    +226
ext4_block_zero_range                        748     972    +224
ext4_split_convert_extents.constprop        2464    2684    +220
__s390x_sys_fsmount                         1988    2208    +220
ptm_open_peer                                894    1108    +214
path_mount                                  2556    2770    +214
gpio_ioctl                                  2604    2818    +214
sk_attach_filter                             108     320    +212
create_new_namespaces                       1354    1564    +210
init_inodes                                 5014    5220    +206
do_coredump                                 7558    7764    +206
can_transceiver_phy_probe                   1134    1340    +206
vt_do_kdgkb_ioctl                           1072    1276    +204
devlink_remove_symlinks                      478     680    +202
dev_pm_opp_set_rate                          444     644    +200
dev_pm_opp_remove_table                      254     454    +200
con_font_op                                 1762    1960    +198
xfrm_lookup_with_ifid                       2518    2714    +196
link_path_walk                              3550    3746    +196
fwnode_dev_initialized                         -     194    +194
do_sys_openat2                               776     968    +192
__sys_accept4                                786     978    +192
dev_pm_opp_remove                            304     494    +190
begin_new_exec                              6554    6744    +190
gpiochip_add_data_with_key                  4208    4396    +188
look_up_user_keyrings                        878    1064    +186
devfreq_add_device                          2330    2516    +186
cec_gpio_probe                               982    1168    +186
unix_ioctl                                  1210    1394    +184
fwnode_get_next_child_node                   246     430    +184
exportfs_decode_fh_raw                       892    1076    +184
__anon_inode_getfd                           690     874    +184
__udp4_lib_lookup                           1402    1584    +182
tty3270_create_view                         1488    1668    +180
linereq_create                              2476    2656    +180
__s390x_sys_io_setup                        3634    3812    +178
linehandle_create                           1404    1578    +174
ext4_ext_migrate                            3264    3436    +172
devtmpfs_work_loop                          1800    1972    +172
dev_pm_opp_of_register_em                    238     410    +172
ocfs2_zero_extend                           3980    4150    +170
ntfs_extend_init                             658     828    +170
keyctl_keyring_search                        464     634    +170
do_eventfd                                   904    1074    +170
__s390x_sys_request_key                      502     672    +170
fwnode_property_read_bool                    254     422    +168
fwnode_property_present                      254     422    +168
of_get_required_opp_performance_state        354     520    +166
hfsplus_bmap_alloc                          1386    1552    +166
icmp_route_lookup.constprop                 1440    1602    +162
ext4_ext_replay_update_ex                    862    1024    +162
get_sum_ranges                               860    1020    +160
ext4_fallocate                              5386    5546    +160
ext4_rename                                 4080    4236    +156
ptmx_open                                    590     744    +154
count_strings_kernel.part                      -     154    +154
pinctrl_enable                              1020    1172    +152
get_leaf_nr                                    -     150    +150
ip_select_ident.constprop                      -     148    +148
freq_qos_read_value                          172     320    +148
ext4_ext_remove_space                       7194    7340    +146
dev_pm_opp_get_max_volt_latency              860    1006    +146
lock_next_vma                                804     948    +144
ext4_swap_extents                           2230    2374    +144
con_set_unimap                               908    1052    +144
vfs_open_tree                               1058    1200    +142
ext4_do_writepages                          5722    5864    +142
devlink_add_symlinks                         496     636    +140
_add_opp_table_indexed                       996    1136    +140
umh_coredump_setup                           394     532    +138
open_new_namespace                           994    1132    +138
...
__debugfs_create_file                        490     524     +34
__d_obtain_alias                             410     444     +34
__br_multicast_add_group                     600     634     +34
wnd_set_free                                 522     554     +32
software_node_register                       170     202     +32
shmem_read_mapping_page_gfp                   96     128     +32
fscrypt_ioctl_add_key                       1032    1064     +32
ext4_enable_quotas                           986    1018     +32
do_move_mount                               1010    1042     +32
bpf_sock_ops_load_hdr_opt                    488     520     +32
_of_init_opp_table                           708     740     +32
__ocfs2_flush_truncate_log                  2194    2226     +32
__cgroup_procs_write                         518     550     +32
xfrm_policy_inexact_alloc_bin               2028    2058     +30
waiting_for_supplier_show                    152     182     +30
vxlan_fdb_create                            2120    2150     +30
vtconsole_class_init                         362     392     +30
vif_add                                     2104    2134     +30
vfs_readlink                                 584     614     +30
unshare_nsproxy_namespaces                   280     310     +30
unregister_filesystem                        206     236     +30
udp_rcv                                     3346    3376     +30
udp_err                                     1596    1626     +30
udp4_lib_lookup2                             714     744     +30
txdone_hrtimer                               410     440     +30
tty_set_ldisc                                784     814     +30
tty_ldisc_reinit                             456     486     +30
tty_ldisc_failto                             320     350     +30
tty_init                                     384     414     +30
tty_driver_lookup_tty                        222     252     +30
traverse.part.constprop                      744     774     +30
stashed_dentry_get                           120     150     +30
sock_init                                    318     348     +30
simple_xattr_add                             838     868     +30
shmem_init                                   516     546     +30
shmem_get_folio_gfp.isra                    1906    1936     +30
setxattr_copy                                240     270     +30
set_anon_vma_name                            466     496     +30
secretmem_init                               158     188     +30
sctp_transport_get_next                      184     214     +30
sctp_setsockopt                            12360   12390     +30
rtnl_net_newid                               850     880     +30
rtnl_link_get_net_capable.constprop          254     284     +30
regulator_init                               316     346     +30
rdev_init_debugfs                            376     406     +30
putname_to_delayed                           226     256     +30
proc_sys_open                                150     180     +30
proc_sys_getattr                             224     254     +30
proc_sys_call_handler                        936     966     +30
proc_mem_open                                166     196     +30
pinmux_select_write                          680     710     +30
pinmux_pins_show                            1080    1110     +30
pinmux_disable_setting                       818     848     +30
pinctrl_select_default_state                 170     200     +30
pinctrl_init                                 288     318     +30
pim_rcv_v1                                   502     532     +30
pim_rcv                                      556     586     +30
pidfs_init                                   290     320     +30
pidfs_free_pid                               492     522     +30
pidfs_add_pid                               1472    1502     +30
pick_link                                   1694    1724     +30
phy_get                                      598     628     +30
phy_create                                   732     762     +30
pfkey_send_policy_notify                     774     804     +30
pfkey_get                                    474     504     +30
pfkey_add                                   3654    3684     +30
path_pivot_root                             1072    1102     +30
ocfs2_xattr_set                             4514    4544     +30
ocfs2_set_acl                                708     738     +30
ocfs2_remove_value_outside                   788     818     +30
ocfs2_delete_xattr_in_bucket                 954     984     +30
ocfs2_create_local_dquot                    1316    1346     +30
ocfs2_acl_chmod                              472     502     +30
o2hb_run_event_list                          598     628     +30
o2hb_register_callback                       744     774     +30
ntfs_iget5                                  6228    6258     +30
nsfs_init                                    222     252     +30
nilfs_symlink                                480     510     +30
nilfs_make_empty                             646     676     +30
nilfs_ioctl                                 4588    4618     +30
nilfs_get_dentry                             230     260     +30
ni_expand_list                              1864    1894     +30
netlink_unicast                              664     694     +30
netlink_seq_start                            194     224     +30
neigh_xmit                                   532     562     +30
neigh_get                                   1376    1406     +30
mnt_warn_timestamp_expiry                    384     414     +30
md_import_device                             596     626     +30
md_alloc_and_put                             134     164     +30
mbox_controller_unregister                   318     348     +30
mbox_controller_register                     686     716     +30
lookup_one_qstr_excl                         388     418     +30
lookup_one_positive_killable                 224     254     +30
lock_mount_exact                             794     824     +30
link_and_create_debugfs                      458     488     +30
kthread_create_worker_on_node                296     326     +30
kmemleak_seq_stop                             96     126     +30
kernel_clone                                1012    1042     +30
kbd_event                                   1958    1988     +30
kbd_bh                                       402     432     +30
ipv4_neigh_lookup                            328     358     +30
ip_send_unicast_reply                       1978    2008     +30
ip_mr_output                                1098    1128     +30
ip_mr_input                                  834     864     +30
io_unregister_zcrx                           436     466     +30
io_terminate_zcrx                            430     460     +30
io_subchannel_create_ccwdev                 1264    1294     +30
inode_insert5                                580     610     +30
init_rescuer                                 502     532     +30
inet_rtm_newaddr                            1912    1942     +30
ilookup5_nowait                              180     210     +30
icmp_reply                                   976    1006     +30
handle_dots                                 2286    2316     +30
gpiod_count                                  352     382     +30
gpiochip_request_own_desc                    302     332     +30
gpiochip_add_pin_range_with_pins             432     462     +30
gpio_to_desc                                 258     288     +30
gpio_chip_match_by_fwnode                    168     198     +30
gfs2_meta_get_tree                           438     468     +30
gfs2_glock_get                              1800    1830     +30
gfs2_get_link                                498     528     +30
gfs2_atomic_open                             296     326     +30
get_file_active                              102     132     +30
genl_sk_priv_get                             376     406     +30
genl_ctrl_event.isra                         986    1016     +30
fscrypt_setup_encryption_info               1980    2010     +30
finish_no_open                                84     114     +30
find_insert_glock                           1898    1928     +30
filename_lookup                              308     338     +30
ext4_xattr_block_find                        446     476     +30
ext4_tmpfile                                 530     560     +30
ext4_release_dquot                           852     882     +30
ext4_quota_write                             742     772     +30
ext4_mkdir                                  1016    1046     +30
ext4_mb_init_cache                          2334    2364     +30
ext4_convert_unwritten_extents               660     690     +30
ext4_bread_batch                             496     526     +30
ext2_readdir                                1276    1306     +30
ext2_make_empty                              524     554     +30
expand_files                                 960     990     +30
eventfs_create_dir                           554     584     +30
encrypted_read                               916     946     +30
down_write_nested                            246     276     +30
down_write                                   242     272     +30
down_read_non_owner                          216     246     +30
down_read_nested                             248     278     +30
down_read                                    244     274     +30
do_take_over_console                         830     860     +30
do_file_open                                 288     318     +30
do_add_mount                                 370     400     +30
dma_get_any_slave_channel                    148     178     +30
dma_async_device_register                   1788    1818     +30
devm_regulator_register                      178     208     +30
devm_power_supply_register                   178     208     +30
devm_phy_get                                 170     200     +30
devm_phy_create                              178     208     +30
devm_of_phy_optional_get                     116     146     +30
devm_of_phy_get                              192     222     +30
devm_mux_control_get                         170     200     +30
devm_mux_chip_alloc                          178     208     +30
devm_fwnode_pwm_get                          176     206     +30
devm_devfreq_add_device                      186     216     +30
devlink_nl_sb_port_pool_set_doit             376     406     +30
devlink_nl_sb_pool_set_doit                  398     428     +30
devlink_nl_rate_new_doit                     672     702     +30
device_links_check_suppliers                 760     790     +30
devfreq_init                                 322     352     +30
dev_fill_metadata_dst                        486     516     +30
debugfs_create_symlink                       308     338     +30
d_splice_alias_ops                           946     976     +30
create_pinctrl                              1376    1406     +30
connect_old_root_work                        116     146     +30
collapse_file                               5948    5978     +30
cgroup_do_get_tree                           514     544     +30
call_sbin_request_key                       1126    1156     +30
br_multicast_new_group                      1564    1594     +30
bitmap_parse                                 478     508     +30
bdev_release                                 352     382     +30
bdev_cache_init                              286     316     +30
aio_setup                                    322     352     +30
_regulator_bulk_get                          416     446     +30
_opp_config_regulator_single                 542     572     +30
_of_phy_get                                  504     534     +30
_down_write_nest_lock                        246     276     +30
_devm_regulator_get                          178     208     +30
_devm_of_regulator_get                       186     216     +30
__s390x_sys_timer_delete                     136     166     +30
__power_supply_populate_supplied_from        268     298     +30
__ip_do_redirect                            1338    1368     +30
__init_rwsem                                 166     196     +30
__icmp_send                                 4288    4318     +30
__filename_parentat                          400     430     +30
__devm_of_phy_provider_register              186     216     +30
workqueue_apply_unbound_cpumask             1090    1118     +28
regulator_resolve_supply                    1734    1762     +28
key_move                                     446     474     +28
io_prep_reg_iovec                            264     292     +28
init_encrypted                               214     242     +28
inetdev_event                               1970    1998     +28
inet_rtm_getroute                           3788    3816     +28
ext4_punch_hole                             1540    1568     +28
dquot_get_next_dqblk                         180     208     +28
dev_pm_opp_put_opp_table                     494     522     +28
configfs_dir_open                            218     246     +28
__dquot_initialize                           934     962     +28
write_mmp_block                              808     834     +26
tx_tick                                      270     296     +26
tty_unregister_driver                        224     250     +26
tty_port_hangup                              284     310     +26
tty_port_close_start                         646     672     +26
try_to_wake_up                              1182    1208     +26
tmigr_setup_groups                          3634    3660     +26
tmigr_clear_cpu_available                    626     652     +26
set_cpus_allowed_force                       196     222     +26
sched_mm_cid_fork                            864     890     +26
sched_exec                                   276     302     +26
request_percpu_nmi                           408     434     +26
request_nmi                                  594     620     +26
pty_stop                                     216     242     +26
pty_start                                    216     242     +26
pty_set_termios                              510     536     +26
pty_close                                    674     700     +26
process_echoes                               234     260     +26
proc_maps_open.constprop                     182     208     +26
power_supply_set_property                    448     474     +26
posix_timer_unhash_and_free                  228     254     +26
posix_timer_delete                           394     420     +26
posix_timer_add_at                           340     366     +26
pin_free                                     542     568     +26
pidfs_exit                                   340     366     +26
ocfs2_grab_eof_folios                        636     662     +26
ntfs_fs_reconfigure                          584     610     +26
n_tty_read                                  1930    1956     +26
n_tty_packet_mode_flush                      208     234     +26
n_tty_ioctl                                  450     476     +26
mm_cid_work_fn                               278     304     +26
migrate_disable_switch.isra                  264     290     +26
mbox_seq_show                                352     378     +26
mbox_clean_and_put_channel                   156     182     +26
linereq_put_event                            214     240     +26
lineinfo_watch_read                         1188    1214     +26
lineinfo_changed_func                        442     468     +26
kthread_affine_preferred                     626     652     +26
irq_set_affinity_notifier                    422     448     +26
irq_domain_free                              238     264     +26
irq_affinity_notify                          216     242     +26
ip_finish_output2                           2458    2484     +26
io_zcrx_copy_chunk                           762     788     +26
io_unregister_pbuf_ring                      458     484     +26
io_register_pbuf_ring                       1152    1178     +26
io_free_bpf_filters                          296     322     +26
io_close_queue                               328     354     +26
insert_retry.constprop.isra                 1146    1172     +26
input_unregister_handle                      174     200     +26
input_ff_upload                             1124    1150     +26
handle_nested_irq                            326     352     +26
gpiod_request                                240     266     +26
gpiod_direction_output_nonotify              452     478     +26
gpio_set_open_source_value_commit            392     418     +26
gpio_set_open_drain_value_commit             386     412     +26
gpio_desc_to_lineinfo                       1190    1216     +26
gpio_chrdev_release                          200     226     +26
get_instantiation_keyring                    222     248     +26
futex_pivot_hash                             134     160     +26
fscrypt_prepare_new_inode                    474     500     +26
free_irq                                    1290    1316     +26
ext4_resetent                                324     350     +26
do_remove_key.isra                           734     760     +26
do_ftruncate                                 330     356     +26
dev_uevent                                   796     822     +26
crypto_register_alg                          552     578     +26
create_worker                               1110    1136     +26
complete_getname                              82     108     +26
commit_echoes                                306     332     +26
check_tty_count                              374     400     +26
cgroup_setup_root                           1538    1564     +26
_opp_remove_all_static                       186     212     +26
_opp_add                                    1048    1074     +26
_add_opp_dev                                 164     190     +26
__tmigr_set_cpu_available                    608     634     +26
__power_supply_get_property                  644     670     +26
__mbox_bind_client                           526     552     +26
__kthread_bind_mask                          210     236     +26
__free_percpu_irq                            782     808     +26
__do_SAK                                     800     826     +26
__balance_push_cpu_stop                      268     294     +26
vfs_get_acl                                  212     236     +24
tty_port_default_wakeup                      118     142     +24
tcp_v4_rcv                                  5900    5924     +24
sunkbd_enable                                174     198     +24
rtm_get_nexthop_bucket                       566     590     +24
ntfs_read_write_run                          810     834     +24
nilfs_mkdir                                  434     458     +24
irq_set_irq_type                             226     250     +24
gpiod_get_index_optional                      72      96     +24
gpiod_get_array_optional                      72      96     +24
devm_gpiod_get_index_optional                 72      96     +24
devm_gpiod_get_array_optional                 72      96     +24
cgroup_addrm_files                          1320    1344     +24
__disable_irq_nosync                         220     244     +24
zcrx_flush_rq.isra                           778     800     +22
secretmem_fault                              760     782     +22
sctp_sendmsg                                3620    3642     +22
ocfs2_journal_init                          1514    1536     +22
ocfs2_attach_refcount_tree                  1970    1992     +22
key_unlink                                   236     258     +22
add_new_master_key.isra                      654     676     +22
timens_offsets_write                         686     706     +20
ni_write_parents                             402     422     +20
irq_set_msi_desc_off                         272     292     +20
irq_set_handler_data                         234     254     +20
irq_set_chip_data                            234     254     +20
irq_set_chip                                 214     234     +20
irq_percpu_is_enabled                        266     286     +20
irq_get_irqchip_state                        238     258     +20
disable_percpu_irq                           178     198     +20
can_request_irq                              286     306     +20
__tty_port_tty_hangup                        178     198     +20
__s390x_sys_listmount                       1674    1694     +20
__irq_set_handler                            192     212     +20
__irq_apply_affinity_hint                    246     266     +20
vt_move_to_console                           206     224     +18
vt_disallocate_all                           208     226     +18
show_bind                                    124     142     +18
ocfs2_start_trans                           1070    1088     +18
ni_read_folio_cmpr                          1000    1018     +18
netlink_insert                              1430    1448     +18
jump_label_update                            458     476     +18
jump_label_text_reserved                     378     396     +18
jump_label_module_notify                     984    1002     +18
io_napi_sqpoll_busy_poll                     190     208     +18
con_get_cmap                                 408     426     +18
__ocfs2_recovery_thread                     3406    3424     +18
__io_napi_busy_loop                          458     476     +18
__io_napi_add_id                             898     916     +18
wnd_is_free_hlp                              444     460     +16
teardown_percpu_nmi                          436     452     +16
prepare_percpu_nmi                           564     580     +16
ocfs2_local_read_info                       2158    2174     +16
ocfs2_initialize_super.isra                 5752    5768     +16
ocfs2_init_acl                               918     934     +16
irq_set_vcpu_affinity                        280     296     +16
irq_set_irqchip_state                        362     378     +16
irq_set_chained_handler_and_data             208     224     +16
irq_modify_status                            566     582     +16
enable_percpu_irq                            332     348     +16
enable_irq                                   290     306     +16
bpf_sock_ops_store_hdr_opt                   526     542     +16
try_release_thread_stack_to_cache            402     416     +14
nsfs_fh_to_dentry                           1888    1902     +14
input_pass_values                            604     618     +14
futex_private_hash                           148     162     +14
futex_hash_allocate_default                  350     364     +14
futex_hash                                   154     168     +14
filesystems_proc_show                        220     234     +14
d_parent_ino                                 288     302     +14
con_get_trans_old                            348     362     +14
con_get_trans_new                            278     292     +14
br_multicast_new_port_group                 2354    2368     +14
__symbol_get                                 258     272     +14
__futex_pivot_hash                           764     778     +14
mpage_map_and_submit_buffers                1192    1204     +12
input_grab_device                            286     298     +12
input_flush_device                           282     294     +12
freq_qos_update_request                      226     238     +12
filemap_map_pages                           2844    2856     +12
__ext4_ioctl                                9146    9158     +12
ocfs2_local_free_info                        918     928     +10
ntfs_trim_fs                                 956     966     +10
irq_update_affinity_desc                     474     484     +10
ext4_evict_inode                            1804    1814     +10
wq_watchdog_timer_fn                        1226    1234      +8
fscontext_read                               990     998      +8
freq_qos_remove_request                      218     226      +8
__crypto_register_alg                        372     380      +8
udf_process_sequence                        6494    6500      +6
ocfs2_wipe_inode                            2202    2208      +6
ntfs_readlink_hlp.constprop                 1956    1962      +6
irq_set_irq_wake                             572     578      +6
__iommu_take_dma_ownership                   370     376      +6
truncate_inode_pages_range                  1326    1330      +4
rfc6803_calc_KDF_FEEDBACK_CMAC              1486    1490      +4
ocfs2_reserve_suballoc_bits                 4618    4622      +4
ocfs2_dlm_init                              1306    1310      +4
o2hb_do_disk_heartbeat                      2052    2056      +4
keyctl_pkey_query                            352     356      +4
kernel_waitid_prepare                        426     430      +4
ext4_mb_new_blocks                          6748    6752      +4
dyn_event_release                            390     394      +4
disk_scan_partitions                         390     394      +4
devlink_nl_region_notify                     746     750      +4
br_mdb_add_group_srcs                       1178    1182      +4
replace_fd                                   246     248      +2
psp_device_get_locked                        236     238      +2
ocfs2_extend_allocation                     2914    2916      +2
ksys_dup3                                    348     350      +2
iomap_dio_rw                                 220     222      +2
input_open_device                            594     596      +2
compat_only_sysfs_link_entry_to_kobj         308     310      +2
sysfs_do_create_link_sd                      344     342      -2
sysfs_add_file_mode_ns                       584     582      -2
sysfs_add_bin_file_mode_ns                   388     386      -2
iptfs_output_collect                        2780    2778      -2
fib_create_info                             4898    4896      -2
ap_poll_thread_start                         320     318      -2
xts_create                                  1104    1100      -4
swiotlb_alloc_pool                          1142    1138      -4
squashfs_decompress                         2202    2198      -4
seq_lseek                                    374     370      -4
mext_move_extent                            5356    5352      -4
lrw_create                                  1052    1048      -4
inet_dump_addr                              1086    1082      -4
cryptomgr_notify                            1438    1434      -4
cmm_init                                     334     330      -4
ap_module_init                              1742    1738      -4
input_register_device                       1606    1600      -6
udf_load_vrs                                1440    1432      -8
ocfs2_local_write_info                       252     244      -8
internal_create_group                       1952    1944      -8
traceprobe_expand_dentry_args                548     538     -10
o2hb_thread                                 1440    1428     -12
gfs2_internal_read                           624     612     -12
ext4_bio_write_folio                        2402    2390     -12
tracepoint_user_put                          180     166     -14
io_sqe_buffer_register                      2312    2298     -14
erofs_readdir                               2118    2100     -18
__func__                                  429895  429877     -18
sk_attach_bpf                                118      96     -22
input_register_handler                       474     448     -26
input_register_handle                        494     464     -30
get_first_leaf                               122      90     -32
nilfs_copy_back_pages                        942     908     -34
fprobe_register                             1094    1058     -36
dev_pm_opp_of_find_icc_paths                 520     484     -36
read_cache_page                              128      90     -38
__irq_domain_instantiate                    1978    1938     -40
read_cache_page_gfp                           96      54     -42
ocfs2_rename                                8070    8026     -44
trace_fprobe_create_cb                      3488    3440     -48
delayed_getname_uflags                       104      48     -56
delayed_getname                              102      46     -56
folio_file_page                               62       -     -62
netdev_nl_bind_tx_doit                       966     892     -74
netdev_nl_bind_rx_doit                      1756    1668     -88
ip_select_ident_segs.constprop               148       -    -148
count_strings_kernel                         168       -    -168
sk_reuseport_attach_bpf                      308      96    -212
__msg                                      31129   30897    -232
dev_pm_opp_set_config                       2714    2462    -252
__sk_attach_prog                             262       -    -262
IS_ERR.isra                                  264       -    -264
IS_ERR.constprop.isra                        342       -    -342
dev_change_xdp_fd                           1442    1002    -440
IS_ERR_OR_NULL                              9150       -   -9150
IS_ERR                                     16466       -  -16466
Total: Before=39593511, After=39652429, chg +0.15%

